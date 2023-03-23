import 'dart:convert';
import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';

class LeerCarnetSocioController extends GetxController {

  LeerCarnetSocioController();

  LecturaNFC lecturaNFC = LecturaNFC();
  Rx<String> lectura = ''.obs; 
  Rx<String> id = ''.obs; 
  Rx<bool> leyendo = false.obs; 
  Rx<int> segundosDeDiferencia = 0.obs;
  int segundosDeTomaDeLectura = 5;
  
  @override
  void onReady() async {

    if (PreferenciasDeUsuarioStorage.puntoDeControlId == 0)
    {
      Get.showSnackbar(const GetSnackBar(
                      backgroundColor: kErrorBackColor,
                      snackPosition: SnackPosition.BOTTOM,
                      title: 'ATENCION',
                      isDismissible: true,
                      message: "Debes seleccionar un PUNTO de CONTROL !",
                      duration: Duration(seconds: 3)));

      Get.back();
      //Get.offNamed(AppRoutes.rCSFSeleccionarPuntoDeControl);
    }
    super.onReady();
  }


  //*----------------------------------------------------------- LECTURA COMPLETA
  void readNFC() async {
    
    lectura.value = '';
    id.value = '';
    leyendo.value = false;
    await FlutterNfcKit.finish();

    try {
      
      leyendo.value = true;

      // timeout only works on Android, while the latter two messages are only for iOS
      var tag = await FlutterNfcKit.poll(
          timeout: Duration(seconds: segundosDeTomaDeLectura),
          iosMultipleTagMessage: "Multiples tags encontrados!",
          iosAlertMessage: "Escane el tag");

      debugPrint(jsonEncode(tag));

      if (tag.type == NFCTagType.iso7816) {
        // timeout is still Android-only, persist until next change
        var result = await FlutterNfcKit.transceive("00B0950000");
        debugPrint(result);
      }

      var jsonCrudo = jsonEncode(tag);
      lecturaNFC = LecturaNFC.fromRawJson(jsonCrudo);

      lectura.value = jsonCrudo;
      id.value = lecturaNFC.id.toString().toUpperCase();
      id.refresh();

      if (GetPlatform.isIOS)
      {
        await FlutterNfcKit.setIosAlertMessage("Hola !");
      }

      // read NDEF records if available
      if (tag.ndefAvailable!) {
        /// decoded NDEF records (see [ndef.NDEFRecord] for details)
        /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
        for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
          debugPrint(record.toString());
        }
      }

      //*---------------------------------------------------------
      //*-- VALIDAMOS CARNET DE SOCIO
      //*---------------------------------------------------------
      if (id.value.isNotEmpty)
      {
        Get.toNamed(AppRoutes.rCSFShowCarnetById, arguments: { 'uid': id.value });
      }

    }
    on PlatformException catch (e)
    {
      debugPrint(e.toString());
    }
    catch (e) {
      
      Get.showSnackbar(const GetSnackBar(
                      backgroundColor: kErrorBackColor,
                      snackPosition: SnackPosition.BOTTOM,
                      title: 'ERROR',
                      isDismissible: true,
                      message: "Oooops, error de lectura !",
                      duration: Duration(seconds: 3)));

    }
    finally {
      leyendo.value = false;
      await FlutterNfcKit.finish();
    }
    
  }
  
}
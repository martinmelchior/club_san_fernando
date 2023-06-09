

import 'dart:convert';

import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';

class LecturaSinControlController extends GetxController {

  LecturaSinControlController();

  LecturaNFC lecturaNFC = LecturaNFC();
  Rx<String> lectura = ''.obs; 
  Rx<String> id = ''.obs; 
  Rx<bool> leyendo = false.obs; 
  Rx<int> segundosDeDiferencia = 0.obs;
  int segundosDeTomaDeLectura = 10;

  
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
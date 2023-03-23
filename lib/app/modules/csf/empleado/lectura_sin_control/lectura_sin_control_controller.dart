

import 'dart:convert';

import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';

class LecturaSinControlController extends GetxController {

  LecturaSinControlController();

  LecturaNFC lecturaNFC = LecturaNFC();
  Rx<String> lectura = ''.obs; 
  Rx<String> id = ''.obs; 
  
  //*----------------------------------------------------------- LECTURA COMPLETA
  void readNFC() async {
    
    await FlutterNfcKit.finish();

    // timeout only works on Android, while the latter two messages are only for iOS
    var tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 10),
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

    await FlutterNfcKit.finish();
  }
  
}
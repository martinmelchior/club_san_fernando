
import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpleadoHomeController extends GetxController {

  Rx<String> pc = ''.obs;

  @override
  void onReady() async {

    if (PreferenciasDeUsuarioStorage.puntoDeControlId == 0)
    {
      Get.showSnackbar(const GetSnackBar(
                      backgroundColor: Color(0xff2D3133),
                      snackPosition: SnackPosition.BOTTOM,
                      title: 'RECUERDA',
                      isDismissible: true,
                      borderRadius: 5.0,
                      borderColor: Colors.white24,
                      margin: EdgeInsets.all(10),
                      snackStyle: SnackStyle.FLOATING,
                      message: "Debes seleccionar un PUNTO de CONTROL !\nDe lo contrario NO podrás empezar a validar !",
                      duration: Duration(seconds: 6
                      )));

    }
    super.onReady();
  } 
}
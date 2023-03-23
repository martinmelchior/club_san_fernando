

import 'package:get/get.dart';

import 'validar_socio_controller.dart';

class ValidarSocioBinding implements Bindings {

  @override
  void dependencies() {
    
    Get.lazyPut<ValidarSocioController>(() => ValidarSocioController());
    
  }
} 
  


import 'package:get/get.dart';

import 'leer_carnet_socio_controller.dart';

class LeerCarnetSocioBinding implements Bindings {

  @override
  void dependencies() {
    
    Get.lazyPut<LeerCarnetSocioController>(() => LeerCarnetSocioController());
    
  }
} 
  
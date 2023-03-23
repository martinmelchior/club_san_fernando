

import 'package:get/get.dart';
import 'empleado_home_controller.dart';
import 'empleado_home_provider.dart';

class EmpleadoHomeBinding implements Bindings {

  @override
  void dependencies() {
    
    Get.lazyPut<EmpleadoHomeController>(() => EmpleadoHomeController());
    Get.lazyPut<EmpleadoHomeProvider>(() => EmpleadoHomeProvider());
  }
} 
  
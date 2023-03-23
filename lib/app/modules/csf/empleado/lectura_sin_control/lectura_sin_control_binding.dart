

import 'package:get/get.dart';

import 'lectura_sin_control_controller.dart';

class LecturaSinControlBinding implements Bindings {

  @override
  void dependencies() {
    
    Get.lazyPut<LecturaSinControlController>(() => LecturaSinControlController());
    
  }
} 
  
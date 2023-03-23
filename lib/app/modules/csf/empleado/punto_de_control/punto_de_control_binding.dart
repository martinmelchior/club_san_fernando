import 'package:get/get.dart';

import 'punto_de_control_controller.dart';
import 'punto_de_control_provider.dart';

class PuntoDeControlBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<PuntoDeControlController>(() => PuntoDeControlController());
    Get.lazyPut<PuntoDeControlProvider>(() => PuntoDeControlProvider());
  }

}
import 'package:get/get.dart';
import 'carnet_controller.dart';
import 'carnet_provider.dart';

class CarnetBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CarnetController>(() => CarnetController());
    Get.lazyPut<CarnetProvider>(() => CarnetProvider());
  }
}
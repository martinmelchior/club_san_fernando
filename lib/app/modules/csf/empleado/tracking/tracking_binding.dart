import 'package:get/get.dart';

import 'tracking_controller.dart';
import 'tracking_provider.dart';

class TrackingBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<TrackingController>(() => TrackingController());
    Get.lazyPut<TrackingProvider>(() => TrackingProvider());
  }

}


import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/utils/manager_api_exceptions.dart';
import 'package:get/get.dart';

import 'tracking_provider.dart';

class TrackingController extends GetxController with StateMixin<TrackingResponse> {

  final TrackingProvider apiProvider = Get.find<TrackingProvider>();
  TrackingController();

  TrackingResponse response = TrackingResponse();

  // * ----------------------------------------------------------------------------- onReady
  @override
  void onReady() async {
    await obtenerTrackingDeSocios();
    super.onReady();
  }

  // * ----------------------------------------------------------------------------- obtenerPuntosDeControl
  Future<TrackingResponse> obtenerTrackingDeSocios() async {
    try {
      change(null, status: RxStatus.loading());
      response = await apiProvider.obtenerTrackingDeSocios();
      change(response, status: response.listaDeTracking.isEmpty 
        ? RxStatus.empty() 
        : RxStatus.success());
    } 
    catch(e) {
      String error = ApiExceptions.getCustomError(e);
      change(null, status: RxStatus.error(error));
    }
    return response;
  }
}


import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/utils/manager_api_exceptions.dart';
import 'package:get/get.dart';

import 'punto_de_control_provider.dart';

class PuntoDeControlController extends GetxController with StateMixin<PuntoDeControlResponse> {

  final PuntoDeControlProvider apiProvider = Get.find<PuntoDeControlProvider>();
  PuntoDeControlController();

  PuntoDeControlResponse response = PuntoDeControlResponse();

  // * ----------------------------------------------------------------------------- onReady
  @override
  void onReady() async {
    await obtenerPuntosDeControl();
    super.onReady();
  }

  // * ----------------------------------------------------------------------------- obtenerPuntosDeControl
  Future<PuntoDeControlResponse> obtenerPuntosDeControl() async {
    try {
      change(null, status: RxStatus.loading());
      response = await apiProvider.obtenerPuntosDeControl();
      change(response, status: response.listaDePuntosDeControl.isEmpty 
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
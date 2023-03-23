
import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/utils/manager_api_exceptions.dart';
import 'package:get/get.dart';

import 'carnet_provider.dart';

class CarnetController extends GetxController with StateMixin<Socio> {

  CarnetController();

  final CarnetProvider apiProvider = Get.find<CarnetProvider>();
  Socio socio = Socio();
  Rx<String> uid = ''.obs;

  @override
  void onInit() async {
    uid.value = Get.arguments["uid"];
    await validarCarnet();
    super.onInit();
  }


  // * ----------------------------------------------------------------------------- obtenerPuntosDeControl
  Future<Socio> validarCarnet() async {
    try {
      change(null, status: RxStatus.loading());
      socio = await apiProvider.validarCarnet(uid.value);
      change(socio, status: socio.uid.isEmpty 
        ? RxStatus.empty() 
        : RxStatus.success());
    } 
    catch(e) {
      String error = ApiExceptions.getCustomError(e);
      change(null, status: RxStatus.error(error));
    }
    return socio;
  }

}
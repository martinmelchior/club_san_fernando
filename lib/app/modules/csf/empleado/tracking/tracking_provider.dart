import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

import '../../model/model.dart';

class TrackingProvider extends GetConnect {

  final d.Dio _dio = Get.find<d.Dio>();

  //*------------------------------------------------------------------------------------------ obtenerPuntosDeControl
  Future<TrackingResponse> obtenerTrackingDeSocios() async {
    final d.Response r = await _dio.post("/CSF/ObtenerTrackingDeSocios");
    return TrackingResponse.fromJson(r.data);  
  }


}
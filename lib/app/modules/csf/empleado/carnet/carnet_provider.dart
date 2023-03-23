import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

class CarnetProvider extends GetConnect {

  final d.Dio _dio = Get.find<d.Dio>();

  //*------------------------------------------------------------------------------------------ validar Carnet
  Future<Socio> validarCarnet(String uid) async {
    final d.Response r = await _dio.post("/CSF/ValidarCarnet", data: { "uid": uid, "puntoDeControlId": PreferenciasDeUsuarioStorage.puntoDeControlId });
    return Socio.fromJson(r.data);  
  }


}
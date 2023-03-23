import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PuntoDeControlProvider extends GetConnect {

  final d.Dio _dio = Get.find<d.Dio>();

  //*------------------------------------------------------------------------------------------ obtenerPuntosDeControl
  Future<PuntoDeControlResponse> obtenerPuntosDeControl() async {
    final d.Response r = await _dio.post("/CSF/ObtenerPuntosDeControl");
    return PuntoDeControlResponse.fromJson(r.data);  
  }


}
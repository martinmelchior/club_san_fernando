


import 'package:clubsanfernando/app/data/models/application_settings_model.dart';
import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/manager_api_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application_settings_repository.dart';


class ApplicationSettingsController extends GetxController {

  final ApplicationSettingsRepository _repository = Get.find<ApplicationSettingsRepository>();

  var appShowServicioCtaCte = false.obs;
  var appShowServicioCtaCteGranaria = false.obs;
  var appShowServicioEA = false.obs;
  var appShowServicioVendedor = false.obs;
  var appShowServicioLecheria = false.obs;
  var appShowServicioOLContratista = false.obs;
  var appShowServicioOLIngeniero = false.obs;
  var appShowServicioPosiciones = false.obs;
  //-- ADD 2.2
  var appShowServicioCtaCteDolares = false.obs;
  //-- ADD 2.4
  var appShowCotizacionesMonedas = false.obs;
  var appShowCotizacionesCereales = false.obs;
  //-- ADD 3.1
  var appShowSeguimientoDeLabores = false.obs;
  var esIngenieroExternoTracking = false.obs;

  // * --------------------------------------------------------------------------- getApplicationSettings
  Future<ApplicationSettingsResponse> loadApplicationSettings() async { 

    ApplicationSettingsResponse response = ApplicationSettingsResponse();
    Get.dialog(const Center(child: kTCpi), barrierDismissible: false);
    try {

      if (PreferenciasDeUsuarioStorage.tokenDeAcceso == '') 
      {
        throw Exception('No tienes token de acceso !');
      }

      ApplicationSettingsRequest _apiRequest = ApplicationSettingsRequest(
        tokenDeAcceso: PreferenciasDeUsuarioStorage.tokenDeAcceso,
        tokenDeRefresco: PreferenciasDeUsuarioStorage.tokenDeRefresco,
        tokenMobile: PreferenciasDeUsuarioStorage.tokenMobile,
      );

      response = await _repository.loadApplicationSettings(_apiRequest);

      // * ----------------------------------------------------------------- Cargo las observables 
      appShowServicioCtaCte.value = response.showServicioCtaCte ?? false;
      appShowServicioCtaCteGranaria.value = response.showServicioCtaCteGranaria ?? false;
      appShowServicioEA.value = response.showServicioEA == false;
      appShowServicioVendedor.value = response.showServicioVendedor ?? false;
      appShowServicioLecheria.value = response.showServicioLecheria ?? false;
      appShowServicioOLContratista.value = response.showServicioOLContratista ?? false;
      appShowServicioOLIngeniero.value = response.showServicioOLIngeniero ?? false;
      appShowServicioPosiciones.value = response.showServicioPosiciones ?? false;
      //-- ADD 2.2
      appShowServicioCtaCteDolares.value = response.showServicioCtaCteDolares ?? false;
      //-- ADD 2.4
      appShowCotizacionesMonedas.value = response.showCotizacionesMonedas ?? false;
      appShowCotizacionesCereales.value = response.showCotizacionesCereales ?? false;
      //-- ADD 3.1
      appShowSeguimientoDeLabores.value = response.showSeguimientoDeLabores ?? false;

      Get.back();
     
    } 
    catch(e) {
      Get.back();
      ApiExceptions.procesarError(e);
    }

    return response;
  }

}
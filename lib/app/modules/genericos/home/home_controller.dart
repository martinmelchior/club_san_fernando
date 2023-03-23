

import 'package:get/get.dart';
import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/modules/genericos/controllers/aplicacion_settings/application_settings_controller.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/utils/manager_api_exceptions.dart';

class HomeController extends GetxController {

  
  final ApplicationSettingsController _appSettingController = Get.find<ApplicationSettingsController>();
  ApplicationSettingsController get applicationSettingsController => _appSettingController;
  
  final isLoaded = true.obs; 

  

  @override
  void onReady() async {

    try {
      await loadData();

      if (PreferenciasDeUsuarioStorage.aceptoTYC == false)
      {
        // * ADD v2.0 (server) - Debe aceptar los nuevos terminos y condiciones
        Get.toNamed(AppRoutes.rAceptarTyC);
      }

    } catch (e) {

        if (e.toString().contains('ACCESO DENEGADO'))
        {
          //-- Fuerzo a login
          PreferenciasDeUsuarioStorage.isFirstTime = true;
        }

        ApiExceptions.procesarError(e);
    }
    finally {
      super.onReady();
    }
  }

  Future<void> loadData() async {

    isLoaded.toggle();

    //* Cargo ApplicationSettiongs !!
    await applicationSettingsController.loadApplicationSettings();
    
  }

  
}
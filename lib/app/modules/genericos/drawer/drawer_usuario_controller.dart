

import 'package:get/get.dart';
import 'package:clubsanfernando/app/modules/genericos/controllers/aplicacion_settings/application_settings_controller.dart';

class DrawerUsuarioController extends GetxController {

  final ApplicationSettingsController _appSettingController = Get.find<ApplicationSettingsController>();
  ApplicationSettingsController get applicationSettingsController => _appSettingController;
  
}
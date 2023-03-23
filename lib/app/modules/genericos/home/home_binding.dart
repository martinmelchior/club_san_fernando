

import 'package:get/get.dart';
import 'package:clubsanfernando/app/modules/genericos/controllers/aplicacion_settings/application_settings_controller.dart';
import 'package:clubsanfernando/app/modules/genericos/controllers/aplicacion_settings/application_settings_provider.dart';
import 'package:clubsanfernando/app/modules/genericos/controllers/aplicacion_settings/application_settings_repository.dart';
import 'package:clubsanfernando/app/modules/genericos/home/home_provider.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    
    //-- ADD 2.4
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeProvider>(() => HomeProvider());

    Get.lazyPut<ApplicationSettingsController>(() => ApplicationSettingsController());
    Get.lazyPut<ApplicationSettingsRepository>(() => ApplicationSettingsRepository());
    Get.lazyPut<ApplicationSettingsProvider>(() => ApplicationSettingsProvider());

    


  }
} 
  
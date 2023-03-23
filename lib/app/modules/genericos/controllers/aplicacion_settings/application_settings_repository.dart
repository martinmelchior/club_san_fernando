


import 'package:clubsanfernando/app/data/models/application_settings_model.dart';
import 'package:get/get.dart';

import 'application_settings_provider.dart';


class ApplicationSettingsRepository {

  final ApplicationSettingsProvider apiProvider = Get.find<ApplicationSettingsProvider>();

  Future<ApplicationSettingsResponse> loadApplicationSettings(ApplicationSettingsRequest request) async {
    return apiProvider.loadApplicationSettings(request);
  }

  
}
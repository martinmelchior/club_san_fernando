import 'package:clubsanfernando/app/utils/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';

import 'close_session_controller.dart';

class CloseSessionPage extends StatelessWidget {

  final CloseSessionController controller = Get.find<CloseSessionController>();

  CloseSessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(  
      body: Stack(
        children: [
          kTBackgroundContainer,
          const MyProgressIndicactor(mensaje: 'Cerrando tu sesión !'),
        ],
      )
    );
  }
}
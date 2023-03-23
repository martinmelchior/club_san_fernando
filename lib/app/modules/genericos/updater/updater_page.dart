import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/global_widgets.dart';
import 'updater_controller.dart';


class UpdaterPage extends StatelessWidget {
  
  final UpdaterController controller = Get.find<UpdaterController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  UpdaterPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
          children: <Widget>[
            kTBackgroundContainer,
            const MyProgressIndicactor(mensaje: 'Buscando actualizaciones ...',),
          ]
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/global_widgets.dart';
import 'updater_controller.dart';


class UpdaterPage extends StatelessWidget {
  
  final UpdaterController controller = Get.find<UpdaterController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  UpdaterPage({Key? key}) : super(key: key);
  
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        backgroundColor: kBackHomeEmpleado,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
            children: <Widget>[
              kWidgetBackgroundImage1,
              const MyProgressIndicactor(mensaje: 'Buscando actualizaciones ...',),
            ]
        )
      ),
    );
  }
}
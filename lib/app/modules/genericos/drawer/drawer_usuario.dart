import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';

import 'drawer_usuario_controller.dart';

class DrawerUsuario extends GetView<DrawerUsuarioController> {
  const DrawerUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DrawerUsuarioController>(() => DrawerUsuarioController());

    _menuCerrarSesion() {
      return InkWell(
        onTap: () => Get.toNamed(AppRoutes.rCerrarSesion),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Expanded(
                flex: 1, 
                child:Icon(Icons.exit_to_app, color: kTIconColor)),
              Expanded(
                flex: 6, 
                child:Text('Cerrar Sessión', style: TextStyle(color: kTIconColor))),
            ],
          ),
        ),
      );
    }

    _menuInfoApp() {
      return InkWell(
        onTap: () => Get.toNamed(AppRoutes.rAppVersion),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Expanded(
                flex: 1, 
                child:Icon(Icons.info_outline, color: kTIconColor)),
              Expanded(
                flex: 6, 
                child: Text('Información de la App',
                  style: TextStyle(color: kTIconColor))),
            ],
          ),
        ),
      );
    }


    _menuFeedback() {
      return InkWell(
        onTap: () => Get.toNamed(AppRoutes.rEnviarFeedback),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1, 
                child: Image.asset(Constants.kImgFeedback, width: 25, height: 25)),
              const Expanded(
                flex: 5,
                child: Text('Necesito Ayuda', style: TextStyle(color: kTIconColor))),
              const Expanded(
                flex: 1, child: Icon(Icons.arrow_right, color: kTIconColor)),
            ],
          ),
        ),
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(backgroundColor: kTLightPrimaryColor3),
      child: Drawer(
        semanticLabel: "Menu",
        child: Stack(
          children: [
            kTBackgroundContainer,
            Column(
              children: <Widget>[
                _buildDrawerHeader(context),
                const SizedBox(height: 20.0),
                _menuFeedback(),
                const SizedBox(height: 20.0),
                _menuInfoApp(),
                const SizedBox(height: 20.0),
                _menuCerrarSesion(),
                const Expanded(child: SizedBox(height: 200)),
              ],
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
          '${PreferenciasDeUsuarioStorage.nombre.capitalize} ${PreferenciasDeUsuarioStorage.apellido.capitalize}',
          style: const TextStyle(fontSize: 18.0)),
      accountEmail: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(PreferenciasDeUsuarioStorage.email,
              style: const TextStyle(fontSize: 12))),
      currentAccountPicture: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/logoEmpresa.png'),
            fit: BoxFit.contain),
      )),
    );
  }
}

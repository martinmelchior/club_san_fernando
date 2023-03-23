import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/modules/genericos/drawer/drawer_usuario.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  
  const HomePage({Key? key}) : super(key: key);
  
  //------------------------------------------------------------------------------------------------- _saludo
  Widget _saludo() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Hola',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: kTAllLabelsColor)),
            Text(PreferenciasDeUsuarioStorage.nombre.capitalize!,
                style: const TextStyle(fontSize: 15.0, color: kTAllLabelsColor)),
          ]),
        ],
      ),
    );
  }

  //------------------------------------------------------------------------------------------------- _crearBoton
  Widget _crearBoton( String assetImage, String label, double _fontSize) {
    return Card(
        color: kTBackgroundBtnHome,
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: Get.width * 0.33,
            child: Column(
              children: [
                Image.asset(assetImage, width: 70, height: 70),
                const SizedBox(height: 10.0),
                Text(label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _fontSize,
                        fontWeight: FontWeight.bold,
                        color: kTLabelBtnHome)),
              ],
            ),
          ),
        ),
    );
  }
  
  Widget _showMenu() {

    List<Widget> listaW = [];
    listaW.add(_btnFeedback());
    if (listaW.isEmpty) listaW.add(const Center(child: Text('Parece que aún no te han habilitado servicios!', style: TextStyle(color: kTAllLabelsColor))));

    Wrap w = Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 15,
      runSpacing: 15,
      children: listaW,
    );

    return w;
  }  
  
  _btnFeedback() {
    return GestureDetector(
      child: _crearBoton(Constants.kImgFeedback, "Ayuda", 15.5),
      onTap: () => Get.toNamed(AppRoutes.rEnviarFeedback),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kTScaffoldBackColorHome,
      drawer: const DrawerUsuario(),
      appBar: AppBar(
        flexibleSpace: kTflexibleSpace,
        elevation: 20.0,
        iconTheme: const IconThemeData(
          color: kTIconColor, //change your color here
        ),
        title: kTappLogo,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Padding(padding: EdgeInsets.only(right: 25.0), child: Icon(Icons.notifications)),
            onPressed: () => Get.toNamed(AppRoutes.rNotificaciones),
          )
        ],
      ),
      body: Stack(children: [
        kTBackgroundContainer,
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                      child: Column(
                        children: [
                          _saludo(),
                          Container(
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Obx(() => _showMenu())
                          ),
                          const SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
            //-- ADD 2.4
           
          ],
        ),
          
      ]),
    );
  }
}

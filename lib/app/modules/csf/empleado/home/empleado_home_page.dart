import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'empleado_home_controller.dart';

class EmpleadoHomePage extends GetView<EmpleadoHomeController> {
  
  const EmpleadoHomePage({Key? key}) : super(key: key);
  
  //------------------------------------------------------------------------------------------------- _crearBoton
  Widget _crearBoton( String assetImage, String label, double fontSize) {
    return Container(
         decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 65, 65, 65), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: const Color(0xFF242428),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 20,
                offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
            width: Get.width * 0.33,
            height: 140,
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Image.asset(assetImage, width: 70, height: 70),
                const SizedBox(height: 10.0),
                Text(label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: kTLabelBtnHome)),
              ],
          ),
        ),
    );
  }
  
    //*--------------------------------------------- ENU
  Widget _showMenu() {

    List<Widget> listaW = [];
    listaW.add(_btnScanSinControl());
    listaW.add(_btnValidarSocio());
    listaW.add(_btnScanSinControl());
    listaW.add(_btnScanSinControl());
    listaW.add(_btnScanSinControl());

    Wrap w = Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 20,
      runSpacing: 40,
      children: listaW,
    );
    return w;
  }  
  
  //*--------------------------------------------- carnet sin control
  _btnScanSinControl() {
    return GestureDetector(
      child: _crearBoton(Constants.kImgCarnet, "Leer Carnet", 15.5),
      onTap: () => Get.toNamed(AppRoutes.rCSFLecturaSinControl),
    );
  }
  //*--------------------------------------------- validar socio
  _btnValidarSocio() {
    return GestureDetector(
      child: _crearBoton(Constants.kImgCarnet2, "Validar Socio", 15.5),
      onTap: () => Get.toNamed(AppRoutes.rCSFValidarSocio),
    );
  }
  
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        //drawer: const DrawerUsuario(),
        extendBodyBehindAppBar: true,
        backgroundColor: kBackHomeEmpleado,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: [
          SizedBox(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 70.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Empecemos ...', style: TextStyle(color: Color(0xFFA4A4A4), fontFamily: kFontFamily, fontSize: 20)),
                              const SizedBox(height: 40.0),
                              Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                child: _showMenu()
                              ),
                              const SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
          )  
        ]),
      ),
    );
  }
}

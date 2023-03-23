import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/utils.dart';

import 'password_recovery_controller.dart';

class PasswordRecoveryPage extends GetView<PasswordRecoveryController> {
  PasswordRecoveryPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  Widget _email() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Theme(
          data: txtWithBackgound,
          child: Tooltip(
            message: 'Email',
            child: TextFormField(
                //cursorColor: kLightPrimaryColor,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su Email',
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Colors.white60,
                  ),
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(fontSize: 14),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Utilidades.isValidEmailRequired,
                controller: _emailController,
                onSaved: (value) {
                  controller.email = value ?? '';
                }),
          ),
        ),
      );
  }

  Widget _btnPasswordRecovery() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: Get.width * Constants.kResponsiveWithButtons,
        child: FloatingActionButton.extended(
          heroTag: null,
          label: const Text('RECUPERAR',style: TextStyle(color: Colors.white60, letterSpacing: 2.0),
          ),
          shape: kShapeButtons,
          backgroundColor: Colors.white.withOpacity(0.10),
          tooltip: 'Rcuperar contraseña',
        onPressed: () async {
          if (_key.currentState!.validate()) {
            //-- Este save() es el que pasa los valores de las cajas de texto al controller!
            _key.currentState!.save();
            controller.recuperar();
          } else {
            Get.snackbar(
              "ATENCION",
              "Alguno de los datos ingresados no son válidos.\n\nPor favor verifica!",
              snackPosition: SnackPosition.TOP,
              icon: const Icon(Icons.error, color: Colors.white),
              backgroundColor: kErrorBackColor,
              colorText: Colors.white,
              borderRadius: 0.0,
              margin: const EdgeInsets.all(0),
            );
          }
        }
      )
     )
    );
  }

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _emailController.text = Constants.isTesting ? Constants.kEmailTesting : "";

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _key,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                kWidgetBackgroundImage0,
                SafeArea(
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //*------------------- LOGO
                          Container(
                            height: Get.height * 0.45,
                            width: Get.width * 0.52,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage(Constants.kLogoEmpresa),
                            )),
                          ),
                          //*------------------- CAMPOS
                          Container(
                            width: double.infinity,
                            height: Get.height * 0.6,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.65),
                            ),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 30.0),
                                const Text('Recuperar Contraseña',
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                        fontSize: 20.0)),
                                const SizedBox(height: 50.0),
                                _email(),
                                const SizedBox(height: 30.0),
                                _btnPasswordRecovery(),
                              ]
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

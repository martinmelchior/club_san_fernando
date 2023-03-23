import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/utils.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

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
                  labelText: 'Email',
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

  Widget _password() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Theme(
          data: txtWithBackgound,
          child: Tooltip(
            message: 'Contraseña',
            child: TextFormField(
              //cursorColor: kLightPrimaryColor,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.white60,
                ),
                labelStyle: TextStyle(fontSize: 14),
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (val) => (val ?? '').length < 6
                  ? 'Obligatorio y como mínimo 6 caracteres'
                  : null,
              controller: _passwordController,
              onSaved: (value) {
                controller.password = value ?? '';
              },
            ),
          ),
        ),
      );
  }

  Widget _olvideMiContrasenia() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.rPasswordRecovery),
        child: const Text('Olvidé mi contraseña', style: klblLogin),
      ),
    );
  }

  Widget _btnLogin() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
            width: Get.width * Constants.kResponsiveWithButtons,
            child: FloatingActionButton.extended(
              heroTag: null,
              label: const Text('INGRESAR',style: TextStyle(color: Colors.white60, letterSpacing: 2.0),
              ),
              shape: kShapeButtons,
              backgroundColor: Colors.white.withOpacity(0.10),
              tooltip: 'Ingresar',
              onPressed: () async {
                if (_key.currentState!.validate()) 
                {
                  //-- Este save() es el que pasa los valores de las cajas de texto al controller!
                  _key.currentState!.save();
                  controller.autenticar();
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
            ),
      ),
    );
  }

  

  Widget _btnShowMantenimiento() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kTLightPrimaryColor2),
              elevation: MaterialStateProperty.all(15.0),
              padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
          child: const Text(
            'Información Extra',
            style: TextStyle(
              color: Colors.white70,
              letterSpacing: 1.5,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          onPressed: () => Get.toNamed(AppRoutes.rMantenimiento)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _key,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () {
              controller.tapCount++;
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: <Widget>[
                kWidgetBackgroundImage0,
                SafeArea(
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          //*------------------- LOGO
                          Container(
                            height: Get.height * 0.45,
                            width: Get.width * 0.52,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.contain,
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
                                _email(),
                                const SizedBox(height: 10.0),
                                _password(),
                                _olvideMiContrasenia(),
                                const SizedBox(height: 20.0),
                                _btnLogin(),
                                const SizedBox(height: 10.0),
                                _btnSkipToHomeEmpleado(),
                                const SizedBox(height: 10.0),
                                // Obx(() => Visibility(
                                //     visible: controller.tapCount > 10,
                                //     child: _btnShowMantenimiento())),
                                // const SizedBox(height: 50.0),
                              ],
                            ),
                          )
                        ],
                      )
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


  Widget _btnSkipToHomeEmpleado() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
            width: Get.width * Constants.kResponsiveWithButtons,
            child: FloatingActionButton.extended(
              heroTag: null,
              label: const Text('SOY  EMPLEADO',style: TextStyle(color: Colors.white60, letterSpacing: 2.0),
              ),
              shape: kShapeButtons,
              backgroundColor: Colors.white.withOpacity(0.10),
              tooltip: 'Ingresar',
              onPressed: () async => Get.toNamed(AppRoutes.rCSFEmpleadoHome)
            ),
      ),
    );   
  }

  

}

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Ingresa tu Email', style: kTLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kTBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14.0,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: kTIconColorTextBoxLogin),
                hintText: 'ingresa tu email',
                hintStyle: kTHintTextStyle,
                errorStyle: kTLoginTextFieldErrorStyle,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: Utilidades.isValidEmailRequired,
              controller: _emailController,
              onSaved: (value) {
                controller.email = value ?? '';
              }),
        ),
      ],
    );
  }

  Widget _btnPasswordRecovery() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kTBackgroundColorBtnIngresarLogin),
              elevation: MaterialStateProperty.all(15.0),
              padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
          child: const Text(
            'RECUPERAR',
            style: TextStyle(
              color: kTLabelColorBtnIngresarLogin,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
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
          }),
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
                kTBackgroundContainer,
                // CustomPaint(
                //   size: Size(_width, double.infinity), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                //   painter: RPSCustomPainter(),
                // ),
                SafeArea(
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 100.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: kTLogoHeight,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage(Constants.kLogoEmpresa),
                            )),
                          ),
                          const SizedBox(height: 30.0),
                          const Text('Recuperar Contraseña',
                              style: TextStyle(
                                  color: kTLabelTextBoxLogin,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                  fontSize: 20.0)),
                          const SizedBox(height: 50.0),
                          _email(),
                          const SizedBox(height: 30.0),
                          _btnPasswordRecovery(),
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

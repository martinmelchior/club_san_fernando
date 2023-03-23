import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'validar_socio_controller.dart';

class ValidarSocioPage extends GetView<ValidarSocioController> {
  const ValidarSocioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackHomeEmpleado,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Validar Socio'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                const Text("Pulsa LEER CARNET\ny acerca el Carnet\ndel Socio por detrás\nde tu teléfono !", style: TextStyle(color: Colors.green, fontSize: 25), textAlign: TextAlign.center),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Obx(() => Text(controller.id.toString(), style: const TextStyle(color: Colors.orange, fontSize: 40))),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: SizedBox(
                    child: FloatingActionButton.extended(
                      label: const Text('LEER  CARNET',
                        style: TextStyle(color: Colors.white60, letterSpacing: 2.0, fontSize: 15),
                      ),
                      shape: kShapeButtons,
                      backgroundColor: Colors.white.withOpacity(0.10),
                      tooltip: 'Ingresar',
                      onPressed: controller.readNFC),
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

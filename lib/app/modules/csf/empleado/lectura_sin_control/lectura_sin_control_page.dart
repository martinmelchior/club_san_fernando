import 'package:clubsanfernando/app/modules/csf/empleado/lectura_sin_control/lectura_sin_control_controller.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LecturaSinControlPage extends GetView<LecturaSinControlController> {
  const LecturaSinControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackHomeEmpleado,
      appBar: AppBar(
        title: const Text('Lectura de Carnet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: const EdgeInsets.all(4),
                width: double.infinity,
                height: Get.height * 0.40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 65, 65, 65), width: 2),
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
                child: Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.lectura.value,
                          style: const TextStyle(color: Colors.white60)),
                    )),
              ),
            ),

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
                    heroTag: null,
                    label: const Text(
                      'LEER  CARNET',
                      style:
                          TextStyle(color: Colors.white60, letterSpacing: 2.0),
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
    );
  }
}

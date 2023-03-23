

import 'package:clubsanfernando/app/data/models/preferencias_de_usuario_model.dart';
import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'punto_de_control_controller.dart';

class PuntoDeControlPage extends GetView<PuntoDeControlController> {


  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackHomeEmpleado,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Selecciona tu punto de Control", style: TextStyle(color: Color.fromARGB(255, 187, 190, 189), fontSize: 20)),
                      )
                    ),
                    Expanded(
                      flex: 15,
                      child: controller.obx(
                        (state) => SingleChildScrollView(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView.builder(
                                  physics: const ClampingScrollPhysics(), //! Previene el scroll propio del listview
                                  shrinkWrap: true,
                                  itemCount: state!.listaDePuntosDeControl.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    PuntoDeControl pc = state.listaDePuntosDeControl[index];
                                    return GestureDetector(
                                      onTap: () {
                                        PreferenciasDeUsuarioStorage.puntoDeControlId = pc.puntoDeControlId;
                                        PreferenciasDeUsuarioStorage.puntoDeControl = pc.descripcion;
                                        Get.back(result: pc);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                             decoration: BoxDecoration(
                                              border: Border.all(color: const Color.fromARGB(255, 65, 65, 65), width: 2),
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              color: const Color(0xFF242428),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Center(child: Text(pc.descripcion, style: const TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.bold))),
                                            )
                                          ),
                                          const SizedBox(height: 15),
                                        ],
                                      ),
                                    );
                                  } 
                                ),
                        ),
                        onLoading: const MyProgressIndicactor(mensaje: 'Espere un momento !'),
                        onEmpty: const MyDataNotFoundMessage(colorText: kTLightPrimaryColor, mensaje: 'No hemos encontrado\npuntos de control !',),
                        onError: (error) => Center(child: MyCustomErrorMessage(error: error.toString(), colorText: kTRedColor)),
                      ),
                    )
                    ],
                  ),
            )
          );

  }
}
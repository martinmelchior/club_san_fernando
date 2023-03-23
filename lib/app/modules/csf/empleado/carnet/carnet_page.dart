

import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'carnet_controller.dart';

class CarnetPage extends GetView<CarnetController> {
  
  const CarnetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackHomeEmpleado,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Información del Socio'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,         
          child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  controller.obx(
                    (state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //*---------------- Foto principal
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                width: Get.width * 0.8,
                                padding: const EdgeInsets.all(8), // Border width
                                decoration: const BoxDecoration(color: Color.fromARGB(255, 44, 42, 42), shape: BoxShape.circle),
                                child: state!.foto == ''
                                  ? const CircleAvatar(
                                      radius: 140,
                                      backgroundColor: Color.fromARGB(255, 29, 28, 28),
                                      child: Text('Sin Foto\nDisponible', style: TextStyle(fontSize: 20, color: kTAllLabelsColor), textAlign: TextAlign.center,),
                                    )
                                  : ClipOval(child: Image.network(state.foto, fit: BoxFit.cover)),
                              ),
                            ),
                            Positioned(
                              left: Get.width * 0.65,
                              child: Image.asset(state.activo ? Constants.kImgActivo : Constants.kImgInactivo, width: 110, height: 110)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${state.nombres}, ${state.apellidos}', style: TextStyle(fontFamily: "RobotoCondensed", fontSize: 28, color: state.activo ? const Color(0xFF38926E) : const Color.fromARGB(255, 214, 95, 93), fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(state.nroSocio.toString(), style: const TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center,),
                                      const SizedBox(width: 10.0),
                                      const Text("# SOCIO", style: TextStyle(fontSize: 11, color: kTAllLabelsColor)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(state.dni.toString(), style: const TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center,),
                                      const SizedBox(width: 10.0),
                                      const Text("DNI", style: TextStyle(fontSize: 11, color: kTAllLabelsColor)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                              ...state.listaDeFamiliares.map(
                                  (s) => Column(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 130,
                                                  padding: const EdgeInsets.all(8), // Border width
                                                  decoration: const BoxDecoration(
                                                    color: Color.fromARGB(255, 37, 37, 37), 
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: s.foto == ''
                                                    ? const CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor: Color.fromARGB(255, 29, 28, 28),
                                                        child: Text('Sin Foto\nDisponible', style: TextStyle(fontSize: 20, color: kTAllLabelsColor), textAlign: TextAlign.center,),
                                                      )
                                                    : ClipOval(child: Image.network(s.foto, fit: BoxFit.cover)),
                                                ),
                                              ),
                                              Text(truncateWithEllipsis(12, s.nombres),  overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: kTAllLabelsColor), textAlign: TextAlign.center,),
                                              Text(truncateWithEllipsis(12,s.apellidos), style: const TextStyle(fontSize: 13, color: kTAllLabelsColor), textAlign: TextAlign.center,),
                                              Text(truncateWithEllipsis(12,s.dni.toString()), style: const TextStyle(fontSize: 12, color: Colors.white), textAlign: TextAlign.center,),
                              ],)).toList(),
                              
                          ]),
                        ),

                        
                      ],
                    ),
                    onLoading: const MyProgressIndicactor(mensaje: 'Buscando Socio !'),
                    onEmpty: const MyDataNotFoundMessage(mensaje: 'No hemos encontrado el identificador del Socio !'),
                    onError: (error) => Center(child: MyCustomErrorMessage(error: error.toString())),
                  )
                ],
              ),
            ),
        ),
    );
  }
}

String truncateWithEllipsis(int cutoff, String myString) {
  return (myString.length <= cutoff)
    ? myString
    : '${myString.substring(0, cutoff)}...';
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clubsanfernando/app/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:clubsanfernando/app/modules/csf/model/model.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:clubsanfernando/app/utils/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tracking_controller.dart';

class TrackingPage extends GetView<TrackingController> {

  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackHomeEmpleado,
      appBar: AppBar(
        title: const Text("Seguimiento de Socios"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
       body: controller.obx(
        (state) => 
           ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) => Container(),
                itemCount: state!.listaDeTracking.length,
                itemBuilder: (BuildContext context, int index) {
                  Tracking t = state.listaDeTracking[index];
                  return ShowTracking(tracking: t);
                }),
          onLoading: const MyProgressIndicactor(mensaje: 'Buscando segimientos de Socios !'),
          onEmpty: const MyDataNotFoundMessage(mensaje: "No hemos encontrado seguimientos !", colorText: kTAllLabelsColor),
          onError: (error) => MyCustomErrorMessage(error: error.toString(), colorText: Colors.red),
        ),
          );

  }
}



// * -------------------------------------------------------------------------------------------------- ShowTracking
class ShowTracking extends StatelessWidget {

  const ShowTracking({
    Key? key,
    required this.tracking,
  }) : super(key: key);

  final Tracking? tracking;

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.all(12),
        //color: Colors.red,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: tracking!.foto != '',
                  child: SizedBox(
                    width: 55,
                    child: _imagenSocio(tracking!.foto.trim()),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${tracking!.nombres}, ${tracking!.apellidos}', style: const TextStyle(fontSize: 13.0, color: Colors.white)),
                    Text(MyDateUtils.convertToDateFullDthm(tracking!.fecha).toString(), style: const TextStyle(fontSize: 13.0, color: kTAllLabelsColor)),
                    Text(tracking!.descripcion, style: const TextStyle(fontSize: 13.0, color: Color.fromARGB(255, 230, 227, 189))),
                  ],
                ),
                const SizedBox(width: 10.0),
                Icon(Icons.brightness_1, size: 15, color: tracking!.habilitado ? Colors.green : Colors.red)
              ],
            ),
          ],
        
      ),
    );
  }

  _imagenSocio(String? urlFoto) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: CachedNetworkImage(
          fit: BoxFit.scaleDown,
          imageUrl: urlFoto ?? '',
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green))),
          errorWidget: (context, url, error) => const Icon(Icons.no_photography),
        ),
    );
  }
}
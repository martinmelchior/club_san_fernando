import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:clubsanfernando/app/modules/csf/empleado/lectura_sin_control/lectura_sin_control_controller.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LecturaSinControlPage extends GetView<LecturaSinControlController> {
  LecturaSinControlPage({Key? key}) : super(key: key);

  final CountDownController _controller = CountDownController();
  
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

            Obx(() => Visibility(
              visible: controller.id.value.isNotEmpty,
              child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    child: Text(controller.id.toString(), style: const TextStyle(color: Colors.orange, fontSize: 40))),
            ),
            ),

            Obx(() => Visibility(
                  visible: !controller.leyendo.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: SizedBox(
                      width: Get.width * 0.85,
                      child: FloatingActionButton.extended(
                          heroTag: null,
                          label: const Text('INICIAR  LECTURA',
                              style: TextStyle(
                                  color: Colors.white60, letterSpacing: 2.0)),
                          shape: kShapeButtons,
                          backgroundColor: Colors.white.withOpacity(0.10),
                          tooltip: 'Iniciar lectura',
                          onPressed: controller.readNFC),
                    ),
                  ),
                )),

            //!--------------------------- Circular Count
            Obx(() => Visibility(
                  visible: controller.leyendo.value,
                  child: CircularCount(
                      duration: controller.segundosDeTomaDeLectura,
                      controller: _controller),
                )),
          ],
        ),
      ),
    );
  }
}

class CircularCount extends StatelessWidget {
  CircularCount({
    Key? key,
    required int duration,
    required CountDownController controller,
  })  : _duration = duration,
        _controller = controller,
        super(key: key);

  final int _duration;
  final CountDownController _controller;

  final LecturaSinControlController _controllerLectura = Get.find<LecturaSinControlController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CircularCountDownTimer(
        duration: _duration, // Countdown duration in Seconds.
        initialDuration: 0, // Countdown initial elapsed Duration in Seconds.
        controller:
            _controller, // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        width: Get.width * 0.5, // Width of the Countdown Widget.
        height: Get.height * 0.3, // Height of the Countdown Widget.
        ringColor:
            Colors.grey.withAlpha(50), // Ring Color for Countdown Widget.
        ringGradient: null, // Ring Gradient for Countdown Widget.
        fillColor:
            const Color(0xFF38926E), // Filling Color for Countdown Widget.
        fillGradient: null, // Filling Gradient for Countdown Widget.
        backgroundColor:
            Colors.transparent, // Background Color for Countdown Widget.
        backgroundGradient: null, // Background Gradient for Countdown Widget.
        strokeWidth: 10.0, // Border Thickness of the Countdown Ring.
        strokeCap: StrokeCap.round, // Begin and end contours with a flat edge and no extension.
        textStyle: const TextStyle(
            fontSize: 50,
            color: Colors.white60), // Text Style for Countdown Text.
        textFormat: CountdownTextFormat.S, // Format for the Countdown Text.
        isReverse:
            true, // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverseAnimation:
            false, // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isTimerTextShown: true, // Handles visibility of the Countdown Text.
        autoStart: true, // Handles the timer start.
        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
        },
        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          _controllerLectura.leyendo.value = false;
          //_controller.restart();
        },
      ),
    );
  }
}

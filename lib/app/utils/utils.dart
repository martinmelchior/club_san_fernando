import 'dart:io';
import 'package:clubsanfernando/app/constants.dart';
import 'package:clubsanfernando/app/routes/routes_app.dart';
import 'package:clubsanfernando/app/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

NumberFormat numberFormatN0 = NumberFormat("#,##0", "es_AR");
NumberFormat numberFormat = NumberFormat("#,##0.00", "es_AR");
NumberFormat litrosFormat = NumberFormat("#,###", "es_AR");
DateFormat dateFormatDMY = DateFormat('dd/MM/yyyy');
DateFormat dateFormatDM = DateFormat('dd MMM');

class Utilidades {
  static String getPlatform() {
    String _platform = "";
    if (Platform.isIOS) _platform = "IOS";
    if (Platform.isAndroid) _platform = "ANDROID";
    return _platform;
  }

    static openwhatsapp(context) async {
    var whatsapp = "+549 ${Constants.telWhatsapp}";
    var whatsappUrlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatappUrlIOS = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatappUrlIOS))) {
        await launchUrl(Uri.parse(whatappUrlIOS));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp no instalado")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappUrlAndroid))) {
        await launchUrl(Uri.parse(whatsappUrlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp no instalado")));
      }
    }
  }

  static Future<String> loadFromAsset(String assetsKey) async {
    return await rootBundle.loadString(assetsKey);
  }

  static String? isValidEmailRequired(String? value) {
    if (value == null) return null;
    if (value.trim().isEmpty) {
      return '     El Email es obligatorio!';
    } else if (!GetUtils.isEmail(value)) {
      return '     Email mal formado!';
    } else {
      return null;
    }
  }

  static String? isValidEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Email mal formado!';
    } else {
      return null;
    }
  }

  static bool isValidPhone(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? obligatorio(String? value) {
    if (value == null) return null;
    if (value.trim().isEmpty) {
      return "Dato obligatorio!";
    } else {
      //- retornando null pasa la validacion
      return null;
    }
  }

  static String? noObligatorio(String value) =>
      null; //- retornando null pasa la validacion

}

class MyDialog {
  static Future<void> myShowDialog({String titulo = '', String mensaje = ''}) {
    return Get.dialog(AlertDialog(
      title: Text(
        titulo,
        style: const TextStyle(color: kErrorBackColor),
      ),
      titleTextStyle: const TextStyle(fontSize: 16.0, color: kTRedColor),
      content: Text(mensaje,
          style: const TextStyle(fontSize: 14.0, color: kTAllLabelsColor)),
      actions: [
        TextButton(
            style: kTButtonStyle,
            child: const Text("Cerrar"),
            onPressed: () {
              Get.back();
            }),
      ],
    ));
  }

  static Future<void> myShowDialogDisabledBack(
      {String titulo = '', String mensaje = ''}) {
    //?----------------------------------------------------------------------------------------
    //?--- Evitamos el back !!
    //?----------------------------------------------------------------------------------------
    return showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () => Future.value(false),
              child: const AlertDialog(
                backgroundColor: kTScaffoldBackColor,
                title: Center(
                    child: Text("Aguarda un instante ...",
                        style: TextStyle(fontSize: 15.0))),
                content: SingleChildScrollView(child: Center(child: kTCpi)),
              ));
        });
  }

  static Future<void> myShowDialogDisabledBackError({ String mensaje = 'Oooops parece que ocurrió un error :('}) 
  {
    //?----------------------------------------------------------------------------------------
    //?--- Evitamos el back !!
    //?----------------------------------------------------------------------------------------
    return showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () => Future.value(false),
              child: AlertDialog(
                backgroundColor: kTRedColor,
                title: Center(
                    child: Text(mensaje, style: const TextStyle(fontSize: 15.0))),
                content: const SingleChildScrollView(child: Center(child: kTCpi)),
              ));
        });
  }

  //-- ADD 2.1
  static Future<void> myDialogNewVersion(
      {String titulo = 'NUEVA VERSION DISPONIBLE',
      @required String? url,
      @required String? versionActual,
      @required String? versionNueva}) async {
    //?----------------------------------------------------------------------------------------
    //?--- Evitamos el back !!
    //?----------------------------------------------------------------------------------------
    return showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              backgroundColor: Colors.white.withAlpha(240),
              title: Text(titulo,
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400)),
              content: Column(
                children: [
                  Text(
                      'Te recomendamos DESINSTALAR la versión actual e INSTALAR la nueva versión!\nSi no lo haces, podrías experimentar inconvenientes en el funcionamiento de la App.\n\nTu versión actual es $versionActual y la nueva es $versionNueva !',
                      style: const TextStyle(
                          fontSize: 15.0, color: Colors.black87)),
                  const SizedBox(height: 30.0),
                  Text(
                      'IMPORTANTE:\n\nUna vez instalada la nueva versión, deberás ingresar con tu Email y Contraseña. Si no recuerdas en este momento tu contraseña, podemos asignarte una ahora mismo seleccionando (Enviarme 123456)',
                      style: TextStyle(color: Colors.red.shade400))
                ],
              ),
              actions: [
                TextButton(
                    child: const Text('Enviarme 123456',
                        style: TextStyle(color: Colors.black87)),
                    onPressed: () async => await Get.toNamed(
                        AppRoutes.rEnviar123456,
                        arguments: url)),
                TextButton(
                    child: const Text('Actualizar Versión',
                        style: TextStyle(color: Colors.black87)),
                    onPressed: () => openPlayStore(url: url)),
                TextButton(
                    child: const Text('NO Actualizar',
                        style: TextStyle(color: Colors.black87)),
                    onPressed: () => Get.offAllNamed(AppRoutes.rRedirect)),
              ],
            ),
          );
        });
  }

  static openPlayStore({@required String? url}) async {
    if (await canLaunchUrl(Uri.parse(url!))) {
      await launchUrl(Uri.parse(url));
    }
  }

}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class ValUtils {
  static bool strToBool(String str) {
    return (int.parse(str) > 0) ? true : false;
  }

  static bool intToBool(int val) {
    return (val > 0) ? true : false;
  }

  static String boolToStr(bool val) {
    return (val == true) ? "1" : "0";
  }

  static int boolToInt(bool val) {
    return (val == true) ? 1 : 0;
  }
}

class MyDateUtils {
  static DateTime? convertDMYToYMD(String dmy) {
    try {
      var inputFormat = DateFormat("dd/MM/yyyy");
      var date1 = inputFormat.parse(dmy);

      var outputFormat = DateFormat("yyyy-MM-dd");
      var date2String = outputFormat.format(date1);

      var d = convertToDateYMD(date2String);
      return d;
    } catch (e) {
      return null;
    }
  }

  static DateTime? convertDMYToDMY(String dmy) {
    try {
      var inputFormat = DateFormat("dd/MM/yyyy");
      var d = inputFormat.parse(dmy);
      return d;
    } catch (e) {
      return null;
    }
  }

  static DateTime? convertToDateYMD(String input) {
    try {
      var d = DateFormat("yyyy-MM-dd").parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  static String? convertToDateFull(String input) {
    try {
      var d = DateFormat("yyyy-MM-dd").parseStrict(input);
      var formatter = DateFormat('dd MMM yyyy', 'es');
      return formatter.format(d);
    } catch (e) {
      return null;
    }
  }

  static String? convertToCustomDatePattern(DateTime? input, String pattern) {
    try {
      var formatter = DateFormat(pattern, 'es');
      return input == null ? '' : formatter.format(input);
    } catch (e) {
      return null;
    }
  }

  static String? convertToDateFullDt(DateTime input) {
    try {
      var formatter = DateFormat('dd MMM yyyy', 'es');
      return formatter.format(input);
    } catch (e) {
      return null;
    }
  }

  static String? convertToDateFullDthm(DateTime? input) {
    try {
      var formatter = DateFormat("E dd MMMM yyyy (HH:mm 'hs')", 'es');
      return input == null ? '' : formatter.format(input);
    } catch (e) {
      return null;
    }
  }

  static bool isDate(String dt) {
    try {
      DateFormat("yyyy-MM-dd").parseStrict(dt);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isValidDate(String dt) {
    if (dt.isEmpty || !dt.contains("-") || dt.length < 10) return false;
    List<String> dtItems = dt.split("-");
    var d = DateTime(
        int.parse(dtItems[0]), int.parse(dtItems[1]), int.parse(dtItems[2]));
    return isDate(dt) && d.isAfter(DateTime.now());
  }

  // String functions
  static String daysAheadAsStr(int daysAhead) {
    var now = DateTime.now();
    DateTime ft = now.add(Duration(days: daysAhead));
    return ftDateAsStr(ft);
  }

  static String ftDateAsStr(DateTime ft) {
    return ft.year.toString() +
        "-" +
        ft.month.toString().padLeft(2, "0") +
        "-" +
        ft.day.toString().padLeft(2, "0");
  }

  static String trimDate(String dt) {
    if (dt.contains(" ")) {
      List<String> p = dt.split(" ");
      return p[0];
    } else {
      return dt;
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

//!-- Add 2.6
extension ListUtils<T> on List<T> {
  num sumBy(num f(T element)) {
    num sum = 0;
    for(var item in this) {
      sum += f(item);
    }
    return sum;
  }
}



class RoundedContainer extends StatelessWidget {

  final Color colorBackGround;
  final String texto;

  const RoundedContainer(
    this.colorBackGround, 
    this.texto,
    {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
        color: colorBackGround,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.5),
        child: Center(child: Text(texto, style: const TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.bold))),
      )
  );
  }
}

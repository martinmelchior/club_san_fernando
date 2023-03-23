import 'package:clubsanfernando/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kFontFamily = 'OpenSans';
const kImgBG1     = 'assets/bg2.png';
const kImglogo960 = 'assets/logo_960.png';
//const kBackHomeEmpleado= Color.fromARGB(255, 44, 44, 44);
const kBackHomeEmpleado= Color(0xFF141417);

Widget watermark = const Image(image: AssetImage(kImglogo960), 
                                  height: 400, 
                                  width: 400, color: Color.fromRGBO(255, 255, 255, 0.05), colorBlendMode: BlendMode.modulate);

Widget kWidgetBackgroundImage0 = Container(
                    height: Get.height,
                    width: Get.width,
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(kImgBG1),
                        )
                    ),
                  );

var kShapeButtons = RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Constants.kButtonsBorderRadius),
                      side: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.0)
                    );


//https://coolors.co/1fa536-333333-f7f6f6-7a7979-f5f5f5-2dab44-b5c6b8-f5f6f7-434343-535353
const kTLightPrimaryColor = Color(0xFF838383);
const kTLightPrimaryColor1 = Color(0xFFC9C9C9);
const kTLightPrimaryColor2 = Color(0xFFEEEEEE);
const kTLightPrimaryColor3 = Color(0xFFF0F0F0);

//*-- LISTVIEW
//-------------------------------------------------------------------
const kTItemBackGroundColor = Color(0xFFeeeeee);

//*-- CALENDAR
//-------------------------------------------------------------------
const kTDatePickerPrimary = Color(0xFF298131);
const kTDatePickerOnPrimary = Colors.black54;
const kTDatePickerOnSurface = Color.fromARGB(255, 2, 59, 4);
const kTDatePickerButtons = Colors.black54;


//*-- PANTALLA DE LOGIN Y RECUPERO DE CONTRASEÑA
//-------------------------------------------------------------------
const kTBackgroundColorBtnIngresarLogin = Color(0xFF298131);
const kTLabelColorBtnIngresarLogin = Colors.white70;
const kTIconColorTextBoxLogin = Color(0xFFE2DFDF);
const kTLoginTextFieldErrorStyle = TextStyle(color: Color(0xFF258057), fontWeight: FontWeight.bold);
const kTLabelTextBoxLogin = Color(0xFF606060);

const kTAllLabelsColor = Color(0xFF6E6E6E);
const kTClientesLabelsColor = Color(0xFF6E6E6E);

const kTIconColor = Color(0xFF6E6E6E);
const kTAppBarTextColor = Color(0xFFFFFFFF);

//*-- Progress indicator colors
//-------------------------------------------------------------------
const kTColorProgressIndicator = Color(0xFF298131);
const kTBackgroundColorProgressIndicator = kTLightPrimaryColor1;
const kTLabelColorProgressIndicator = kTLabelColorBtnIngresarLogin;

//*-- Home
//-------------------------------------------------------------------
const kTLabelBtnHome = Color(0xFF6E6E6E);
const kTLabelResumenHome = Color(0xFF878787);
const kTBackgroundBtnHome = Colors.white70;

//*-- Colores estados OL
//-------------------------------------------------------------------
const kOlColorEstadoFacturada = Color(0xFF6b9ae0);
const kOlColorEstadoAnulada = Color(0xFF000000);
const kOlColorEstadoCerrada = Color(0xFF74b72E);
const kOlColorEstadoRealizada = Color(0xFF74cc44);
const kOlColorEstadoPendiente = Color(0xFFFF2400);
const kOlColorEstadoCreada = Colors.white54;
const kOlColorEstadoRemitado = Color(0xFFFF8800);


//*-- Pills
//-------------------------------------------------------------------
const kTPillsBackColor = Color(0xFF4d8b70);
const kTPillsSelectedColor = Color(0xFF4d8b70);

const kTScaffoldBackColor = Color(0xF0FFFFFF);
const kTScaffoldBackColorHome = Color(0xF0FFFFFF);



//*-- Background del avatar de los granos
//-------------------------------------------------------------------
const kTCircleAvatarBackgroundColor = Colors.white70;

//*-- Errores por campos vacíos
//-------------------------------------------------------------------
const kErrorBackColor = Color(0xFFCF5863);
const kErrorTextColor = Color(0xFFFFFFFF);

//*-- Errores en dialog
//-------------------------------------------------------------------
const kDialogErrorBackColor = Color(0xFFCF5863);
const kDialogErrorTextColor = Color(0xFFFFFFFF);

const kTRedColor = Color(0xFFDA3633);

//*-- Logo
//-------------------------------------------------------------------
const kTLogoHeight = 200.0;

//*-- Progress indicator
//-------------------------------------------------------------------
const kTCpi = CircularProgressIndicator(
    color: kTColorProgressIndicator,
    backgroundColor: kTBackgroundColorProgressIndicator);
const kTLpi = LinearProgressIndicator(
    color: kTColorProgressIndicator,
    backgroundColor: kTBackgroundColorProgressIndicator,
    minHeight: 8);

//*-- Login
//*------------------------------------------------------------------
const klblLogin = TextStyle(
  color: Colors.white70,
  fontFamily: kFontFamily,
);

final ThemeData txtWithBackgound = ThemeData.dark().copyWith(
  colorScheme: ThemeData().colorScheme.copyWith(
    onPrimary: Colors.white60,
    primary: Colors.white60,
    secondary: Colors.red),
  errorColor: Colors.red.shade200
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kTLightPrimaryColor,
  colorScheme: ThemeData().colorScheme.copyWith(
        secondary: kTLightPrimaryColor,
      ),
  dialogTheme: const DialogTheme(
    backgroundColor: kTLightPrimaryColor2,
    titleTextStyle: TextStyle(
        color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14.0),
    contentTextStyle: TextStyle(color: Colors.white70, fontSize: 15.0),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kTLightPrimaryColor,
    selectionColor: kTLightPrimaryColor,
    selectionHandleColor: kTLightPrimaryColor,
  ),
  toggleableActiveColor: kTLightPrimaryColor,
  inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: kTLightPrimaryColor)),
  canvasColor: kTLightPrimaryColor,
  fontFamily: kFontFamily, 
);

Widget kTBackgroundContainer = Container(
  height: double.infinity,
  width: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        kTLightPrimaryColor1,
        kTLightPrimaryColor2,
        kTLightPrimaryColor1,
      ],
      stops: [0.0, 0.3, 1.0],
    ),
  ),
);

Widget kTBackgroundContainerLPT = Container(
  height: double.infinity,
  width: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white,
      ],
    ),
  ),
);

Widget kTflexibleSpace = Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[kTLightPrimaryColor1, kTLightPrimaryColor2])));

Image kTappLogo = Image(
    image: ExactAssetImage(Constants.kLogoEmpresaAppBar),
    width: 35.0,
    alignment: FractionalOffset.center);

const kTHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: kFontFamily,
);

const kTLabelStyle = TextStyle(
  color: kTLabelTextBoxLogin,
  fontWeight: FontWeight.bold,
  fontFamily: kFontFamily,
);

final kTBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFFA3B8A8),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 4.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kTButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.all(kTLightPrimaryColor));





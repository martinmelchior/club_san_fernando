import 'package:flutter/foundation.dart';
import 'package:money2/money2.dart';

enum FormMode {
  none,
  update,
  insert,
  delete,
}

enum Roles {
  // ignore: constant_identifier_names
  SUPERADMINISTRADOR,
  // ignore: constant_identifier_names
  ADMINISTRADOR_CLIENTE,
  // ignore: constant_identifier_names
  CLIENTES,
  // ignore: constant_identifier_names
}

extension RolesEx on Roles {
  String toText() => describeEnum(this);
}

class Constants {

  static double kButtonsBorderRadius = 20;
  static double kResponsiveWithButtons = 0.80;

  /* -------------------------------------------------------------------------------*/
  /* -ACA-          MODIFICAR CUANDO PASE DE TESTING A PRODUCCION                   */
  /* -------------------------------------------------------------------------------*/
  static bool isTesting = false;
  static String urlBase = "http://peperina.ddns.net/Generico/";                    //?--- Produccion
  static String urlBaseVersion = '${urlBase}api/v1';

  //* Si encontramos esta constante en urlBase se muestra un BANNER TESTING
  static String kUrlContaintTesting = 'peperina';

  static String andoridId = "ar.com.gmzagro";
  static String urlSite = "https://gmzagro.com.ar";

  static String kLogoEmpresaAppBar = 'assets/logo_960.png';
  static String kLogoEmpresa = 'assets/logo_960.png';
  static String kLogoWhatsapp = 'assets/img/logo-whatsapp.png';
  static String telWhatsapp = "3571 523235";

  static String kImgCtaCte = 'assets/img/ctacte.png';
  static String kImgCtaCteDolar = 'assets/img/ctactedolar.png';
  static String kImgCtaCteGranos = 'assets/img/ctacteGranos.png';
  static String kImgOLNew = 'assets/img/OL_NEW.png';
  static String kImgOLView = 'assets/img/OL_VIEW.png';
  static String kImgFeedback = 'assets/img/feedback.png';
  static String kImgAnuncio = 'assets/img/anuncio.png';
  static String kImgTRK = 'assets/img/TRK.png';
  static String kImgNfc1 = 'assets/img/nfc1.png';
  static String kImgNfc2 = 'assets/img/nfc2.png';
  static String kImgCarnet = 'assets/img/carnet1.png';
  static String kImgCarnet2 = 'assets/img/carnet2.png';
  static String kImgSocio = 'assets/img/socio1.png';
  static String kImgSocio2 = 'assets/img/socio2.png';
  static String kImgPc1     = 'assets/img/pc1.png';
  static String kImgPc2     = 'assets/img/pc2.png';
  static String kImgNoFoto  = 'assets/img/no-foto.png';
  static String kImgActivo  = 'assets/img/inactivo.png';
  static String kImgInactivo  = 'assets/img/activo.png';
  static String kImgTracking  = 'assets/img/map.png';

  static String kEmailSoporte = 'martin.melchior@gmail.com';

  //* Datos para testing
  static String kEmailTesting = 'martin.melchior@gmail.com';
  static String kPassTesting = '159263';

  static String urlDesarrolladoPor = "http://nexobyte.com.ar";

  //--- https://money2.noojee.dev/formatting/formatting-patterns
  static Currency monedaAR = Currency.create('PES', 2,
      invertSeparators: true,
      pattern: 'S #.###,00',
      country: 'Argentina',
      unit: 'Pesos',
      name: 'Pesos Argentinos');

  static Currency monedaUSD = Currency.create('USD', 2,
      symbol: "USD",
      invertSeparators: true,
      pattern: 'S #.###,00',
      country: 'United State',
      unit: 'Dolares',
      name: 'Dolar USA');

  static Currency monedaARN0 = Currency.create('PES', 2,
      invertSeparators: true,
      pattern: 'S #.###',
      country: 'Argentina',
      unit: 'Pesos',
      name: 'Pesos Argentinos');
}

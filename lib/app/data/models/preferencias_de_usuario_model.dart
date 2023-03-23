import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class PreferenciasUsuario {

  String? apellido;
  String? nombre;
  String? email;
  String? rol;
  String? tokenDeAcceso;
  String? tokenDeRefresco;
  String? tokenMobile;
  bool? abrirNotificaciones;
  bool? cambiarPassword;
  String? lastError;
  double? latitud;
  double? longitud;
  bool? isFirstTime;
  String? puntoDeControl;
  int? puntoDeControlId;

  PreferenciasUsuario({
    this.apellido,
    this.nombre,
    this.email,
    this.cambiarPassword,
    this.rol,
    this.tokenDeAcceso,
    this.tokenDeRefresco,
    this.tokenMobile,
    this.abrirNotificaciones,
    this.lastError,
    this.latitud,
    this.longitud,
    this.isFirstTime,
    this.puntoDeControl,
    this.puntoDeControlId,
  });


  factory PreferenciasUsuario.fromRawJson(String str) => PreferenciasUsuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PreferenciasUsuario.fromJson(Map<String, dynamic> json) =>
      PreferenciasUsuario(
        apellido:                     json["apellido"] ?? '',
        nombre:                       json["nombre"] ?? '',
        email:                        json["email"] ?? '',
        rol:                          json["rol"] ?? '',
        tokenDeAcceso:                json["tokenDeAcceso"] ?? '',
        tokenDeRefresco:              json["tokenDeRefresco"] ?? '',
        tokenMobile:                  json["tokenMobile"] ?? '',
        abrirNotificaciones:          json["abrirNotificaciones"] ?? false,
        cambiarPassword:              json["cambiarPassword"] ?? false,
        lastError:                    json["lastError"] ?? '',
        latitud:                      json["latitud"] ?? 0,
        longitud:                     json["longitud"] ?? 0,
        isFirstTime:                  json["isFirstTime"] ?? true,
        puntoDeControl:               json["puntoDeControl"] ?? '',
        puntoDeControlId:             json["puntoDeControlId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "apellido":                   apellido ?? '',
        "nombre":                     nombre ?? '',
        "email":                      email ?? '',
        "rol":                        rol ?? '',
        "tokenDeAcceso":              tokenDeAcceso ?? '',
        "tokenDeRefresco":            tokenDeRefresco ?? '',
        "tokenMobile":                tokenMobile ?? '',
        "abrirNotificaciones":        abrirNotificaciones ?? false,
        "cambiarPassword":            cambiarPassword ?? false,
        "lastError":                  lastError ?? '',
        "latitud":                    latitud ?? 0,
        "longitud":                   longitud ?? 0,
        "isFirstTime":                isFirstTime ?? true,
        "puntoDeControl":             puntoDeControl ?? '',
        "puntoDeControlId":           puntoDeControlId ?? 0,
      };
}

class PreferenciasDeUsuarioStorage {
  //-- almacenamiento en el dispositivo
  static final GetStorage _box = GetStorage();

  //-- GET Y SET del apellido
  static String get apellido => _box.read<String>('apellido') ?? '';
  static set apellido(String value) => _box.write('apellido', value);
  
  //-- GET Y SET del nombre
  static String get nombre => _box.read<String>('nombre') ?? '';
  static set nombre(String value) => _box.write('nombre', value);
  
  //-- GET Y SET del email
  static String get email => _box.read<String>('email') ?? '';
  static set email(String value) => _box.write('email', value);
  
  //-- GET Y SET del ROL
  static String get rol => _box.read<String>('rol') ?? '';
  static set rol(String value) => _box.write('rol', value);
  
  //-- GET Y SET del tokenDeAcceso
  static String get tokenDeAcceso => _box.read<String>('tokenDeAcceso') ?? '';
  static set tokenDeAcceso(String value) =>  _box.write('tokenDeAcceso', value);
  
  //-- GET Y SET del tokenDeRefresco
  static String get tokenDeRefresco => _box.read<String>('tokenDeRefresco') ?? '';
  static set tokenDeRefresco(String value) => _box.write('tokenDeRefresco', value);

  //-- GET Y SET del tokenDeRefresco
  static String get tokenMobile => _box.read<String>('tokenMobile') ?? '';
  static set tokenMobile(String value) => _box.write('tokenMobile', value);
  
  //-- GET Y SET del cambiarPassword
  static bool get cambiarPassword => _box.read<bool>('cambiarPassword') ?? false;
  static set cambiarPassword(bool value) => _box.write('cambiarPassword', value);

  //-- GET Y SET del abrirNotificaciones
  static bool get abrirNotificaciones => _box.read<bool>('abrirNotificaciones') ?? false;
  static set abrirNotificaciones(bool value) => _box.write('abrirNotificaciones', value);

  //-- GET Y SET del lastError
  static String get lastError => _box.read<String>('lastError') ?? '';
  static set lastError(String value) => _box.write('lastError', value);

  //-- GET Y SET del latitud
  static double get latitud => _box.read<double>('latitud') ?? 0;
  static set latitud(double value) => _box.write('latitud', value);

  //-- GET Y SET del longitud
  static double get longitud => _box.read<double>('longitud') ?? 0;
  static set longitud(double value) => _box.write('longitud', value);

  //-- GET Y SET del isFirstTime
  static bool get isFirstTime => _box.read<bool>('isFirstTime') ?? true;
  static set isFirstTime(bool value) => _box.write('isFirstTime', value);
  
  //-- GET Y SET del puntoDeControlId
  static int get puntoDeControlId => _box.read<int>('puntoDeControlId') ?? 0;
  static set puntoDeControlId(int value) => _box.write('puntoDeControlId', value);

  //-- GET Y SET del lastError
  static String get puntoDeControl => _box.read<String>('puntoDeControl') ?? '';
  static set puntoDeControl(String value) => _box.write('puntoDeControl', value);

  static PreferenciasUsuario getData() {
    return PreferenciasUsuario(
      apellido: apellido,
      nombre: nombre,
      email: email,
      rol: rol,
      //-- Seguridad
      tokenDeAcceso: tokenDeAcceso,
      tokenDeRefresco: tokenDeRefresco,
      cambiarPassword: cambiarPassword,
      //-- Push
      tokenMobile: tokenMobile,
      abrirNotificaciones: abrirNotificaciones,
      //-- Last Error
      lastError: lastError,
      latitud: latitud,
      longitud: longitud,
    );
  }

  static saveData(Map<String, dynamic> pref) {
    /*
      SI EL MAPA TRAE MAS PROPIEDADES LAS IGNORA YA QUE PISA 
      SOLO LAS PROPIEDADES DE LA CLASE PreferenciasUsuario
    */
    Map<String, dynamic> template = PreferenciasUsuario().toJson();

    pref.forEach((key, value) {
      if (template.containsKey(key)) {
        //print('${key.toString()} - ${value.toString()}');
        _box.write(key, value);
      }
    });
  }

  static inicializar(Map<String, dynamic> pref) async {
    await GetStorage.init();

    //! CREO LAS PROPIEDADES A ALMACENAR SI NO EXISTEN
    pref.forEach((key, value) {
      _box.writeIfNull(key, value);
    });
  }
}

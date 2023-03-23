

import 'dart:convert';

//!-------------------------------------------------------------- LecturaNFC
class LecturaNFC {

  String type;
  String standard;
  String id;
  bool ndefWritable;

  LecturaNFC({
    this.type         = '',
    this.standard     = '',
    this.id           = '',
    this.ndefWritable = false,
  });

  factory LecturaNFC.fromRawJson(String str) => LecturaNFC.fromJson(json.decode(str));

  factory LecturaNFC.fromJson(Map json) => LecturaNFC(
    type:         json["type"] ?? '',
    standard:     json["standard"] ?? '',
    id:           json["id"] ?? '',
    ndefWritable: json["ndefWritable"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "type":         type,
    "standard":     standard,
    "id":           id,
    "ndefWritable": ndefWritable,
  };

}



//!-------------------------------------------------------------- PuntoDeControlResponse
class PuntoDeControlResponse
{
  List<PuntoDeControl> listaDePuntosDeControl;

  PuntoDeControlResponse({
    this.listaDePuntosDeControl = const [],
  });

  factory PuntoDeControlResponse.fromJson(Map json) => PuntoDeControlResponse(
    listaDePuntosDeControl: List<PuntoDeControl>.from(json["listaDePuntosDeControl"].map((x) => PuntoDeControl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listaDePuntosDeControl": List<PuntoDeControl>.from(listaDePuntosDeControl.map((x) => x.toJson())),
  };
}


//!-------------------------------------------------------------- PuntoDeControl
class PuntoDeControl {

  int puntoDeControlId;
  String descripcion;
  String latitud;
  String longitud;

  PuntoDeControl({
    this.puntoDeControlId = 0,
    this.descripcion      = '',
    this.latitud          = '',
    this.longitud         = '',
  });

  factory PuntoDeControl.fromJson(Map json) => PuntoDeControl(
    puntoDeControlId: json["puntoDeControlId"] ?? 0,
    descripcion:      json["descripcion"] ?? '',
    latitud:          json["latitud"] ?? '',
    longitud:         json["longitud"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "puntoDeControlId": puntoDeControlId,
    "descripcion":      descripcion,
    "latitud":          latitud,
    "longitud":         longitud,
  };

}



//!-------------------------------------------------------------- Socio
class Socio {

  int socioId;
  int socioTitularId;
  String uid;
  int nroSocio;
  int dni;
  String apellidos;
  String nombres;
  bool activo;
  String foto;
  List<Socio> listaDeFamiliares;

  Socio({
    this.socioId = 0,
    this.socioTitularId = 0,
    this.uid = '',
    this.nroSocio = 0,
    this.dni = 0,
    this.apellidos = '',
    this.nombres = '',
    this.activo = false,
    this.foto = '',
    this.listaDeFamiliares = const [],
  });

  factory Socio.fromJson(Map json) => Socio(
    socioId:        json["socioId"] ?? 0,
    socioTitularId: json["socioTitularId"] ?? 0,
    uid:            json["uid"] ?? '',
    nroSocio:       json["nroSocio"] ?? 0,
    dni:            json["dni"] ?? 0,
    apellidos:      json["apellidos"] ?? '',
    nombres:        json["nombres"] ?? '',
    activo:         json["activo"] ?? false,
    foto:           json["foto"] ?? '',
    listaDeFamiliares: List<Socio>.from(json["listaDeFamiliares"].map((x) => Socio.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "socioId": socioId,
    "socioTitularId": socioTitularId,
    "uid": uid,
    "nroSocio": nroSocio,
    "dni": dni,
    "apellidos": apellidos,
    "nombres": nombres,
    "activo": activo,
    "foto": foto,
    "listaDeFamiliares": List<Socio>.from(listaDeFamiliares.map((x) => x.toJson())),
  };

}



//!-------------------------------------------------------------- SocioRequest
class SocioRequest {

  String uid;
  int puntoDeControlId;

  SocioRequest({
    this.uid = '',
    this.puntoDeControlId = 0,
  });

  factory SocioRequest.fromJson(Map json) => SocioRequest(
    uid: json["uid"] ?? '',
    puntoDeControlId: json["puntoDeControlId"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "puntoDeControlId": puntoDeControlId,
  };

}




//!-------------------------------------------------------------- Tracking
class Tracking {

  int id;
  DateTime fecha;
  int puntoDeControlId;
  String descripcion;
  int socioId;
  int nroSocio;
  int dni;
  String apellidos;
  String nombres;
  bool activo;
  String foto;
  bool habilitado;


  Tracking({
    required this.id,
    required this.fecha,
    required this.puntoDeControlId,
    required this.descripcion,
    required this.socioId,
    required this.nroSocio,
    required this.dni,
    required this.apellidos,
    required this.nombres,
    required this.activo,
    required this.foto,
    required this.habilitado,
  });

  factory Tracking.fromJson(Map json) => Tracking(
    id:               json["id"] ?? 0,
    fecha:            DateTime.parse(json["fecha"]),
    puntoDeControlId: json["puntoDeControlId"] ?? 0,
    descripcion:      json["descripcion"] ?? '',
    socioId:          json["socioId"] ?? 0,
    nroSocio:         json["nroSocio"] ?? 0,
    dni:              json["dni"] ?? 0,
    apellidos:        json["apellidos"] ?? '',
    nombres:          json["nombres"] ?? '',
    activo:           json["activo"] ?? false,
    foto:             json["foto"] ?? '',
    habilitado:       json["habilitado"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fecha": fecha,
    "puntoDeControlId": puntoDeControlId,
    "descripcion": descripcion,
    "socioId": socioId,
    "nroSocio": nroSocio,
    "dni": dni,
    "apellidos": apellidos,
    "nombres": nombres,
    "activo": activo,
    "foto": foto,
    "habilitado": habilitado,
  };

}

//!-------------------------------------------------------------- TrackingResponse
class TrackingResponse
{
  List<Tracking> listaDeTracking;

  TrackingResponse({
    this.listaDeTracking = const [],
  });

  factory TrackingResponse.fromJson(Map json) => TrackingResponse(
    listaDeTracking: List<Tracking>.from(json["listaDeTracking"].map((x) => Tracking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listaDeTracking": List<Tracking>.from(listaDeTracking.map((x) => x.toJson())),
  };
}
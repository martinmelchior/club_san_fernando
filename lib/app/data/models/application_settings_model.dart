
import 'dart:convert';

//!-------------------------------------------------------------- ApplicationSettingsRequest
class ApplicationSettingsRequest {

    final String? tokenDeAcceso;
    final String? tokenDeRefresco;
    final String? tokenMobile;

    ApplicationSettingsRequest({
        required this.tokenDeAcceso,
        required this.tokenDeRefresco,
        required this.tokenMobile,
    });

    factory ApplicationSettingsRequest.fromJson(Map<String, dynamic> json) => ApplicationSettingsRequest(
      tokenDeAcceso   : json["tokenDeAcceso"],
      tokenDeRefresco : json["tokenDeRefresco"],
      tokenMobile     : json["tokenMobile"],
    );

    Map<String, dynamic> toJson() => {
      "tokenDeAcceso"   : tokenDeAcceso,
      "tokenDeRefresco" : tokenDeRefresco,
      "tokenMobile"     : tokenMobile,
    };
}


//!-------------------------------------------------------------- ApplicationSettingsResponse
class ApplicationSettingsResponse {
  
    //- Settings
    final bool? showServicioCtaCte;
    final bool? showServicioCtaCteDolares;
    final bool? showServicioCtaCteGranaria;
    final bool? showServicioEA;
    final bool? showServicioVendedor;
    final bool? showServicioLecheria;
    final bool? showServicioOLContratista;
    final bool? showServicioOLIngeniero;
    final bool? showServicioPosiciones;
    final bool aceptoTYC;
    //-- ADD 2.4
    final bool? showCotizacionesMonedas;
    final bool? showCotizacionesCereales;
    //-- ADD 3.1
    final bool? showSeguimientoDeLabores;
    final bool? esIngenieroExternoTracking;

    ApplicationSettingsResponse({
      //- Settings
      this.showServicioCtaCte,
      this.showServicioCtaCteDolares,
      this.showServicioCtaCteGranaria,
      this.showServicioEA,
      this.showServicioVendedor,
      this.showServicioLecheria,
      this.showServicioOLContratista,
      this.showServicioOLIngeniero,
      this.showServicioPosiciones,
      this.aceptoTYC = true,
      //-- ADD 2.4
      this.showCotizacionesCereales,
      this.showCotizacionesMonedas,
      //-- ADD 3.1
      this.showSeguimientoDeLabores,
      this.esIngenieroExternoTracking,
    });

    factory ApplicationSettingsResponse.fromRawJson(String str) => ApplicationSettingsResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApplicationSettingsResponse.fromJson(Map<String, dynamic> json) => ApplicationSettingsResponse(
      //- Settings
      showServicioCtaCte          : json["showServicioCtaCte"],
      showServicioCtaCteDolares   : json["showServicioCtaCteDolares"],
      showServicioCtaCteGranaria  : json["showServicioCtaCteGranaria"],
      showServicioEA              : json["showServicioEA"],
      showServicioVendedor        : json["showServicioVendedor"],
      showServicioLecheria        : json["showServicioLecheria"],
      showServicioOLContratista   : json["showServicioOLContratista"] ?? false,
      showServicioOLIngeniero     : json["showServicioOLIngeniero"] ?? false,
      showServicioPosiciones      : json["showServicioPosiciones"] ?? false,
      aceptoTYC                   : json["aceptoTYC"] ?? true,                //-- Por si la api no tiene esta version
      //-- ADD 2.4
      showCotizacionesCereales    : json["showCotizacionesCereales"] ?? false,
      showCotizacionesMonedas     : json["showCotizacionesMonedas"] ?? false,
      //-- ADD 3.1
      showSeguimientoDeLabores    : json["showSeguimientoDeLabores"] ?? false,
      esIngenieroExternoTracking  : json["esIngenieroExternoTracking"] ?? true,
    );

    Map<String, dynamic> toJson() => {
      //- Settings
      "showServicioCtaCte"          : showServicioCtaCte,
      "showServicioCtaCteDolares"   : showServicioCtaCteDolares,
      "showServicioCtaCteGranaria"  : showServicioCtaCteGranaria,
      "showServicioEA"              : showServicioEA,
      "showServicioVendedor"        : showServicioVendedor,
      "showServicioLecheria"        : showServicioLecheria,
      "showServicioOLContratista"   : showServicioOLContratista,
      "showServicioOLIngeniero"     : showServicioOLIngeniero,
      "showServicioPosiciones"      : showServicioPosiciones,
      "aceptoTYC"                   : aceptoTYC,
      //-- ADD 2.4
      "showCotizacionesCereales"    : showCotizacionesCereales,
      "showCotizacionesMonedas"     : showCotizacionesMonedas,
      //-- ADD 3.1
      "showSeguimientoDeLabores"    : showSeguimientoDeLabores,
      "esIngenieroExternoTracking"  : esIngenieroExternoTracking,
    };
}

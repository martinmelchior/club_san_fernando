

import 'dart:convert';

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
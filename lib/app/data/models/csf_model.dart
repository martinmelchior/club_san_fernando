

class CarnetNFC {
  
  String type;
  String standard;
  String id;

  CarnetNFC({
    this.type = '', 
    this.standard = '',
    this.id = ''
  });

  factory CarnetNFC.fromJson(Map json) => CarnetNFC(
    type: json["type"] ?? '',
    standard: json["standard"] ?? '',
    id: json["id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "standard": standard,
    "id": id,
  };
}
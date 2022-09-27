// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ModelEmploy> welcomeFromJson(String str) => List<ModelEmploy>.from(json.decode(str).map((x) => ModelEmploy.fromJson(x)));

String welcomeToJson(List<ModelEmploy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelEmploy {
  ModelEmploy({
    this.domain,
    this.employ,
  });

  String? domain;
  List<Employ>? employ;

  factory ModelEmploy.fromJson(Map<String, dynamic> json) => ModelEmploy(
    domain: json["domain"],
    employ: List<Employ>.from(json["employ"].map((x) => Employ.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "domain": domain,
    "employ": List<dynamic>.from(employ!.map((x) => x.toJson())),
  };
}

class Employ {
  Employ({
    this.name,
    this.email,
    this.domain,
  });

  String? name;
  String? email;
  String? domain;

  factory Employ.fromJson(Map<String, dynamic> json) => Employ(
    name: json["name"],
    email: json["email"],
    domain: json["domain"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "domain": domain,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}

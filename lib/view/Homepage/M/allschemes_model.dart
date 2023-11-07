// To parse this JSON data, do
//
//     final allSchemesModel = allSchemesModelFromJson(jsonString);

import 'dart:convert';

AllSchemesModel allSchemesModelFromJson(String str) =>
    AllSchemesModel.fromJson(json.decode(str));

String allSchemesModelToJson(AllSchemesModel data) =>
    json.encode(data.toJson());

class AllSchemesModel {
  int? total;
  List<Datum>? data;

  AllSchemesModel({
    this.total,
    this.data,
  });

  factory AllSchemesModel.fromJson(Map<String, dynamic> json) =>
      AllSchemesModel(
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? name;
  String? image;

  Datum({
    this.id,
    this.name,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

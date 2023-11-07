// To parse this JSON data, do
//
//     final allPlansModel = allPlansModelFromJson(jsonString);

import 'dart:convert';

AllPlansModel allPlansModelFromJson(String str) =>
    AllPlansModel.fromJson(json.decode(str));

String allPlansModelToJson(AllPlansModel data) => json.encode(data.toJson());

class AllPlansModel {
  int? total;
  List<Datum>? data;

  AllPlansModel({
    this.total,
    this.data,
  });

  factory AllPlansModel.fromJson(Map<String, dynamic> json) => AllPlansModel(
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
  String? type;
  String? price;

  Datum({
    this.id,
    this.name,
    this.type,
    this.price,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "price": price,
      };
}

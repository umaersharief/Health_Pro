// To parse this JSON data, do
//
//     final planDetailsModel = planDetailsModelFromJson(jsonString);

import 'dart:convert';

PlanDetailsModel planDetailsModelFromJson(String str) =>
    PlanDetailsModel.fromJson(json.decode(str));

String planDetailsModelToJson(PlanDetailsModel data) =>
    json.encode(data.toJson());

class PlanDetailsModel {
  Data? data;

  PlanDetailsModel({
    this.data,
  });

  factory PlanDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlanDetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? name;
  String? type;
  String? price;
  String? image;
  Clinics? clinics;

  Data({
    this.id,
    this.name,
    this.type,
    this.price,
    this.image,
    this.clinics,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        price: json["price"],
        image: json["image"],
        clinics:
            json["clinics"] == null ? null : Clinics.fromJson(json["clinics"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "price": price,
        "image": image,
        "clinics": clinics?.toJson(),
      };
}

class Clinics {
  int? total;
  List<Datum>? data;

  Clinics({
    this.total,
    this.data,
  });

  factory Clinics.fromJson(Map<String, dynamic> json) => Clinics(
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
  String? description;
  String? area;
  String? logo;
  int? totalReviews;
  int? averageReviews;

  Datum({
    this.id,
    this.name,
    this.description,
    this.area,
    this.logo,
    this.totalReviews,
    this.averageReviews,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        area: json["area"],
        logo: json["logo"],
        totalReviews: json["total_reviews"],
        averageReviews: json["average_reviews"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "area": area,
        "logo": logo,
        "total_reviews": totalReviews,
        "average_reviews": averageReviews,
      };
}

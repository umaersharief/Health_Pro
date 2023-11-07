// To parse this JSON data, do
//
//     final clinicsDetailModel = clinicsDetailModelFromJson(jsonString);

import 'dart:convert';

ClinicsDetailModel clinicsDetailModelFromJson(String str) =>
    ClinicsDetailModel.fromJson(json.decode(str));

String clinicsDetailModelToJson(ClinicsDetailModel data) =>
    json.encode(data.toJson());

class ClinicsDetailModel {
  ClinikData? data;

  ClinicsDetailModel({
    this.data,
  });

  factory ClinicsDetailModel.fromJson(Map<String, dynamic> json) =>
      ClinicsDetailModel(
        data: json["data"] == null ? null : ClinikData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class ClinikData {
  String? id;
  String? name;
  String? description;
  String? website;
  String? area;
  String? phone;
  String? time;
  String? location;
  List<String>? image;
  int? totalReviews;
  int? averageReviews;
  Services? services;

  ClinikData({
    this.id,
    this.name,
    this.description,
    this.website,
    this.area,
    this.phone,
    this.time,
    this.location,
    this.image,
    this.totalReviews,
    this.averageReviews,
    this.services,
  });

  factory ClinikData.fromJson(Map<String, dynamic> json) => ClinikData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        website: json["website"],
        area: json["area"],
        phone: json["phone"],
        time: json["time"],
        location: json["location"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        totalReviews: json["total_reviews"],
        averageReviews: json["average_reviews"],
        services: json["services"] == null
            ? null
            : Services.fromJson(json["services"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "website": website,
        "area": area,
        "phone": phone,
        "time": time,
        "location": location,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "total_reviews": totalReviews,
        "average_reviews": averageReviews,
        "services": services?.toJson(),
      };
}

class Services {
  int? total;
  List<Datum>? data;

  Services({
    this.total,
    this.data,
  });

  factory Services.fromJson(Map<String, dynamic> json) => Services(
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
  String? department;
  String? image;

  Datum({
    this.id,
    this.name,
    this.department,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        department: json["department"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "department": department,
        "image": image,
      };
}

// To parse this JSON data, do
//
//     final myPlanModel = myPlanModelFromJson(jsonString);

import 'dart:convert';

MyPlanModel myPlanModelFromJson(String str) =>
    MyPlanModel.fromJson(json.decode(str));

String myPlanModelToJson(MyPlanModel data) => json.encode(data.toJson());

class MyPlanModel {
  Data? data;

  MyPlanModel({
    this.data,
  });

  factory MyPlanModel.fromJson(Map<String, dynamic> json) => MyPlanModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  String? planName;
  String? planImage;
  String? name;
  String? phone;
  String? email;
  String? idNumber;
  String? dependent;
  String? dob;

  Data({
    this.planName,
    this.planImage,
    this.name,
    this.phone,
    this.email,
    this.idNumber,
    this.dependent,
    this.dob,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        planName: json["plan_name"],
        planImage: json["plan_image"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        idNumber: json["id_number"],
        dependent: json["dependent"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "plan_name": planName,
        "plan_image": planImage,
        "name": name,
        "phone": phone,
        "email": email,
        "id_number": idNumber,
        "dependent": dependent,
        "dob": dob,
      };
}

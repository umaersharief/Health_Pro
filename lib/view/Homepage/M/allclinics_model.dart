import 'package:health_pro/view/ClinicsDetails/M/clinicsdetails_model.dart';

class AllClinicsModel {
  int? total;
  List<ClinikData>? data;

  AllClinicsModel({this.total, this.data});

  AllClinicsModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <ClinikData>[];
      json['data'].forEach((v) {
        data!.add(ClinikData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  String? area;
  String? logo;
  int? totalReviews;
  int? averageReviews;

  Data(
      {this.id,
      this.name,
      this.description,
      this.area,
      this.logo,
      this.totalReviews,
      this.averageReviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    area = json['area'];
    logo = json['logo'];
    totalReviews = json['total_reviews'];
    averageReviews = json['average_reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['area'] = area;
    data['logo'] = logo;
    data['total_reviews'] = totalReviews;
    data['average_reviews'] = averageReviews;
    return data;
  }
}

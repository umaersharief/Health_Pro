class AllClinicsModel {
  int? total;
  List<Data>? data;

  AllClinicsModel({this.total, this.data});

  AllClinicsModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['area'] = this.area;
    data['logo'] = this.logo;
    data['total_reviews'] = this.totalReviews;
    data['average_reviews'] = this.averageReviews;
    return data;
  }
}

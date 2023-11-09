class ClinikSingleDetailModel {
  SingleClinikData? data;

  ClinikSingleDetailModel({this.data});

  ClinikSingleDetailModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? SingleClinikData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SingleClinikData {
  String? id;
  String? name;
  String? description;
  String? website;
  String? area;
  String? phone;
  String? time;
  String? endTime;
  double? latitude;
  double? longitude;
  String? location;
  List<String>? image;
  int? totalReviews;
  int? averageReviews;
  Services? services;

  SingleClinikData(
      {this.id,
      this.name,
      this.description,
      this.website,
      this.area,
      this.phone,
      this.time,
      this.endTime,
      this.latitude,
      this.longitude,
      this.location,
      this.image,
      this.totalReviews,
      this.averageReviews,
      this.services});

  SingleClinikData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    description = json['description'] ?? '';
    website = json['website'] ?? '';
    area = json['area'] ?? '';
    phone = json['phone'];
    time = json['time'] ?? '00:00';
    endTime = json['end_time'] ?? '00:00';
    latitude = double.parse(json['latitude'] ?? '29.418068');
    longitude = double.parse(json['latitude'] ?? '71.670685');
    location = json['location'] ?? '';
    image = json['image'].cast<String>() ?? [];
    totalReviews = json['total_reviews'] ?? 0;
    averageReviews = json['average_reviews'] ?? 0;
    services =
        json['services'] != null ? Services.fromJson(json['services']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['website'] = website;
    data['area'] = area;
    data['phone'] = phone;
    data['time'] = time;
    data['end_time'] = endTime;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['location'] = location;
    data['image'] = image;
    data['total_reviews'] = totalReviews;
    data['average_reviews'] = averageReviews;
    if (services != null) {
      data['services'] = services!.toJson();
    }
    return data;
  }
}

class Services {
  int? total;
  List<Data>? data;

  Services({this.total, this.data});

  Services.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
  String? department;
  String? image;

  Data({this.id, this.name, this.department, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    department = json['department'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['department'] = department;
    data['image'] = image;
    return data;
  }
}

class UserProfileModel {
  Data? data;

  UserProfileModel({this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  dynamic username;
  dynamic phone;
  String? email;
  String? idNumber;
  String? image;
  String? planName;

  Data(
      {this.id,
      this.name,
      this.username,
      this.phone,
      this.email,
      this.idNumber,
      this.image,
      this.planName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    idNumber = json['id_number'];
    image = json['image'];
    planName = json['plan_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['id_number'] = this.idNumber;
    data['image'] = this.image;
    data['plan_name'] = this.planName;
    return data;
  }
}

class UserPlanRegistration {
  Data? data;
  String? payurl;

  UserPlanRegistration({this.data, this.payurl});

  UserPlanRegistration.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    payurl = json['payurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['payurl'] = this.payurl;
    return data;
  }
}

class Data {
  String? name;
  String? dob;
  String? phoneNo;
  String? gender;
  String? planId;
  String? totalPayment;
  int? userId;
  String? paymentStatus;
  String? planStartDate;
  String? id;
  String? tId;
  String? updatedAt;
  String? createdAt;

  Data(
      {this.name,
        this.dob,
        this.phoneNo,
        this.gender,
        this.planId,
        this.totalPayment,
        this.userId,
        this.paymentStatus,
        this.planStartDate,
        this.id,
        this.tId,
        this.updatedAt,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dob = json['dob'];
    phoneNo = json['phone_no'];
    gender = json['gender'];
    planId = json['plan_id'];
    totalPayment = json['total_payment'];
    userId = json['user_id'];
    paymentStatus = json['payment_status'];
    planStartDate = json['plan_start_date'];
    id = json['id'];
    tId = json['transaction_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['phone_no'] = this.phoneNo;
    data['gender'] = this.gender;
    data['plan_id'] = this.planId;
    data['total_payment'] = this.totalPayment;
    data['user_id'] = this.userId;
    data['payment_status'] = this.paymentStatus;
    data['plan_start_date'] = this.planStartDate;
    data['id'] = this.id;
    data['transaction_id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
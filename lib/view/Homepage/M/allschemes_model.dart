class AllSchemesModel {
  int? total;
  List<DataPlan>? data;

  AllSchemesModel({this.total, this.data});

  AllSchemesModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <DataPlan>[];
      json['data'].forEach((v) {
        data!.add(DataPlan.fromJson(v));
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

class DataPlan {
  String? id;
  String? name;
  String? image;
  List<Lists>? lists;

  DataPlan({this.id, this.name, this.image, this.lists});

  DataPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['lists'] != null) {
      lists = <Lists>[];
      json['lists'].forEach((v) {
        lists!.add(Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (lists != null) {
      data['lists'] = lists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String? id;
  String? title;
  String? quantity;
  String? category;
  String? actualRate;
  String? discountedRate;
  String? finalRate;
  Plan? plan;

  Lists(
      {this.id,
      this.title,
      this.quantity,
      this.category,
      this.actualRate,
      this.discountedRate,
      this.finalRate,
      this.plan});

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    category = json['category'];
    actualRate = json['actual_rate'];
    discountedRate = json['discounted_rate'];
    finalRate = json['final_rate'];
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['quantity'] = quantity;
    data['category'] = category;
    data['actual_rate'] = actualRate;
    data['discounted_rate'] = discountedRate;
    data['final_rate'] = finalRate;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class Plan {
  String? id;
  String? name;
  String? type;
  String? price;
  String? image;

  Plan({this.id, this.name, this.type, this.price, this.image});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';

import '../Model/myplan_model.dart';

class MyPlanProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  // get my plan
  List<MyPlanModel> myplanModel = [];
  Future<void> getMyPlans() async {
    updateValue(load: true);
    try {
      final response = await apiService.getMyPlans();
      if (response.statusCode == 200) {
        myplanModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        myplanModel.add(MyPlanModel.fromJson(map));
        notifyListeners();
      } else {
        updateValue(load: false);
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      print("this is error   $error ");
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../Model/myplan_model.dart';

class MyPlanProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  Future<void> updateValue({required bool load}) async {
    _loading = load;
    // notifyListeners();
  }

  ApiService apiService = ApiService();
  // get my plan
  List<MyPlanModel> myplanModel = [];
  Future<void> getMyPlans() async {
    updateValue(load: true);
    try {
      final response = await apiService.getMyPlans();
      log("response.statusCode    ${response.statusCode} ");
      if (response.statusCode == 200) {
        myplanModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        myplanModel.add(MyPlanModel.fromJson(map));
        log("myplanModel    $myplanModel ");
        updateValue(load: false);
        notifyListeners();
      } else {
        updateValue(load: false);
        notifyListeners();
      }
    } catch (error) {
      updateValue(load: false);
      notifyListeners();
      print("this is error   $error ");
    }
  }
}

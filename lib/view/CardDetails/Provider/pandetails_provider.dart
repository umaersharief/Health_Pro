import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../Model/plandetails_model.dart';

class PlanDetailsProvider extends ChangeNotifier {
  String? planID;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  List<PlanDetailsModel> palnDetailsModel = [];
  Future<int?> getPlanbyID() async {
    updateValue(load: true);
    try {
      final response = await apiService.getPlansbyID(planID: planID.toString());
      if (response.statusCode == 200) {
        palnDetailsModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        palnDetailsModel.add(PlanDetailsModel.fromJson(map));
        notifyListeners();

        return palnDetailsModel.first.data?.clinics?.total;
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

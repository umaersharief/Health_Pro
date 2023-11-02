import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/ClinicsDetails/Model/clinicsdetails_model.dart';

class ClinicDetailProvider extends ChangeNotifier {
  String? clinicID;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  List<ClinicsDetailModel> cliicsDetailsModel = [];
  Future<void> getClinicsbyID() async {
    updateValue(load: true);
    try {
      final response =
          await apiService.getClinicsbyID(clinicID: clinicID.toString());
      if (response.statusCode == 200) {
        cliicsDetailsModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        cliicsDetailsModel.add(ClinicsDetailModel.fromJson(map));
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

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/ClinicsDetails/M/clinicsdetails_model.dart';

class ClinicDetailController extends GetxController {
  static ClinicDetailController get my => Get.find();
  int iscliked = 0;
  PageController controller = PageController();
  bool loading = false;

  Future<void> updateValue({required bool load}) async {
    loading = load;
    // notifyListeners();
  }

  ApiService apiService = ApiService();

  ClinicsDetailModel? cliicsDetailsModel;
  Future<void> getClinicsbyID(clinicID) async {
    updateValue(load: true);
    try {
      final response =
          await apiService.getClinicsbyID(clinicID: clinicID.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> map = await jsonDecode(response.toString());
        cliicsDetailsModel = ClinicsDetailModel.fromJson(map);
        update();
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

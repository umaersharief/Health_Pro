import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/ClinicsDetails/M/singleclinik_model.dart';

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

  SingleClinikData? clinikDatta;

  Future<void> getClinicsbyID(clinicID) async {
    updateValue(load: true);
    try {
      final response =
          await apiService.getClinicsbyID(clinicID: clinicID.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> map = await jsonDecode(response.toString());
        log("map $map");
        var cliicsDetailsModel = ClinikSingleDetailModel.fromJson(map);
        clinikDatta = cliicsDetailsModel.data;

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

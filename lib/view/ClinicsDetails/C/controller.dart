import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/ClinicsDetails/M/singleclinik_model.dart';

class ClinicDetailController extends GetxController {
  static ClinicDetailController get my => Get.find();
  int iscliked = 0;
  Map<String, dynamic> clinickLocation = {};
  PageController controller = PageController();
  bool loading = false;

  Future<void> updateValue({required bool load}) async {
    loading = load;
    // notifyListeners();
  }

  ApiService apiService = ApiService();

  SingleClinikData? clinikDatta;

  Future<Map<String, dynamic>> getClinicsbyID(clinicID) async {
    updateValue(load: true);
    try {
      final response =
          await apiService.getClinicsbyID(clinicID: clinicID.toString());
      if (response.statusCode == 200) {
        print('===================================================');
        Map<String, dynamic> map = jsonDecode(response.toString());
        // log("map $map");
        log("map $map");
        clinickLocation = {
          "latitude": map['data']['latitude'],
          "longitude": map['data']['longitude']
        };
        var cliicsDetailsModel = ClinikSingleDetailModel.fromJson(map);
        clinikDatta = cliicsDetailsModel.data;
        update();
        return clinickLocation;
      } else {
        updateValue(load: false);
        return {'error': response.data};
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      print("this is error   $error ");
      return {'error': error.toString()};
    }
  }
}

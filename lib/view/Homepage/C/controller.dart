import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../../Homepage/M/allclinics_model.dart';
import '../../Homepage/M/allschemes_model.dart';
import '../../Homepage/M/corporate_planmodel.dart';
import '../../Homepage/M/individual_planmodel.dart';

class HomeController extends GetxController {
  static HomeController get my => Get.find();

  bool loading = false;

  Future<void> updateValue({required bool load}) async {
    loading = load;
    // notifyListeners();
  }

  ApiService apiService = ApiService();

  // get individual plans
  List<IndividualPlansModel> individualplanModel = [];
  Future<void> getIndividualplan() async {
    updateValue(load: true);
    try {
      final response = await apiService.getIndividualplan();
      if (response.statusCode == 200) {
        individualplanModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        individualplanModel.add(IndividualPlansModel.fromJson(map));
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

  // get corporate card

  List<CorporatePlansModel> corporateplanModel = [];
  Future<void> getCorporateplan() async {
    updateValue(load: true);
    try {
      final response = await apiService.getCorporateplan();

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        corporateplanModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        corporateplanModel.add(CorporatePlansModel.fromJson(map));
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

  // get family and packages card
  AllSchemesModel? schemesPackageModel;
  Future<void> getSchemes() async {
    updateValue(load: true);
    try {
      final response = await apiService.getSchemes();

      // ignore: avoid_print
      if (response.statusCode == 200) {
        // log("json ${response.toString()}");

        var map = json.decode(response.toString());

        schemesPackageModel =
            AllSchemesModel.fromJson(map as Map<String, dynamic>);
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

  // get all cics model
  AllClinicsModel? allClinicsModel;
  Future<void> getallClinics() async {
    updateValue(load: true);
    try {
      final response = await apiService.getallClinics();

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        Map<String, dynamic> map = await jsonDecode(response.toString());

        allClinicsModel = AllClinicsModel.fromJson(map);
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

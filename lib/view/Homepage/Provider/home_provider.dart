import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../Models/allclinics_model.dart';
import '../Models/allschemes_model.dart';
import '../Models/corporate_planmodel.dart';
import '../Models/individual_planmodel.dart';

class HomeProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
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

  // get family and packages card
  List<AllSchemesModel> schemesPackageModel = [];
  Future<void> getSchemes() async {
    updateValue(load: true);
    try {
      final response = await apiService.getSchemes();

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        schemesPackageModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        schemesPackageModel.add(AllSchemesModel.fromJson(map));
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

  // get all clinics model
  List<AllClinicsModel> allClinicsModel = [];
  Future<void> getallClinics() async {
    updateValue(load: true);
    try {
      final response = await apiService.getallClinics();

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        allClinicsModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        allClinicsModel.add(AllClinicsModel.fromJson(map));
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

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/Profile/Model/userprofiel_model.dart';

class UserProfileProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    // notifyListeners();
  }

  ApiService apiService = ApiService();

  List<UserProfileModel> userProfileModel = [];
  Future<void> getUserProfile() async {
    updateValue(load: true);
    try {
      final response = await apiService.getUserProfile();
      if (response.statusCode == 200) {
        userProfileModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        userProfileModel.add(UserProfileModel.fromJson(map));
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

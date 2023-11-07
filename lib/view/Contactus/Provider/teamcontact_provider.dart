import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/BottomNavbar/bottom_navbar.dart';
import '../../../../utils/app_constant.dart';

class TeamContactProvider extends ChangeNotifier {
  String? schmID;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  Future<void> orderPackage({
    required String name,
    required String email,
    required String message,
  }) async {
    updateValue(load: true);
    try {
      var body = {
        'scheme_and_package_id': schmID,
        'name': name,
        'email': email,
        'message': message,
        'type': 'team'
      };
      final response = await apiService.orderPackage(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);
        AppConstant.showCustomSnackBar("Done", isError: false);
        Get.off(() => BottomNavbar(0));
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);

      print("this is error ");
    }
  }

  // family contact
  Future<void> orderfamilyPackage({
    required String name,
    required String email,
    required String message,
  }) async {
    updateValue(load: true);
    try {
      var body = {
        'scheme_and_package_id': schmID,
        'name': name,
        'email': email,
        'message': message,
        'type': 'family'
      };
      final response = await apiService.orderPackage(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);
        AppConstant.showCustomSnackBar("Done", isError: false);
        Get.off(() => BottomNavbar(0));
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      AppConstant.showCustomSnackBar("Old Password doesn't match!",
          isError: true);
      print("this is error ");
    }
  }
}

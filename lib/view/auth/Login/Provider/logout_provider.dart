import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_constant.dart';
import '../../Login/View/login_view.dart';

class LogoutProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  Future<void> logout() async {
    updateValue(load: true);
    try {
      var body = {};
      final response = await apiService.logout(params: body);
      if (response.statusCode == 200) {
        updateValue(load: false);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        print("**** ;******");
        print(
            "****${sharedPreferences.getString(AppConstant.getUserToken)}******");
        sharedPreferences.remove(AppConstant.getUserToken);
        sharedPreferences.remove(AppConstant.getUserID);
        sharedPreferences.remove(AppConstant.saveUserToken);
        sharedPreferences.remove(AppConstant.saveUserID);
        // if (sharedPreferences.getString(AppConstant.saveUserToken) == null &&
        //     sharedPreferences.getString(AppConstant.saveUserID) == null) {
        //   Get.offAll(() => Login());
        //}
        Get.offAll(() => Login());

        AppConstant.showCustomSnackBar("Logout", isError: false);
      } else {
        updateValue(load: false);
      }
    } catch (error) {
      updateValue(load: false);

      print("this is error ");
    }
  }
}

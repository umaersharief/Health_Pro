import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/auth/Login/View/login_view.dart';
import '../../../../utils/app_constant.dart';
import '../View/otpscreen.dart';
import '../View/restpassword.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

// send otp
  Future<void> sendOTP({
    required String email,
  }) async {
    updateValue(load: true);
    try {
      var body = {
        'email': email,
      };
      final response = await apiService.sendOTP(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);

        AppConstant.showCustomSnackBar("Four digit code send to your email",
            isError: false);
        Get.off(() => const Otpscreen());
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);

      // ignore: avoid_print
      print("this is error ");
    }
  }

// varify otp
  Future<void> varifyOTP({
    required String code,
  }) async {
    updateValue(load: true);
    try {
      var body = {
        'token': code,
      };
      final response = await apiService.varifyOTP(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);

        AppConstant.showCustomSnackBar("Four digit code send to your email",
            isError: false);
        Get.to(() => ResetPassword(code: code));
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);

      // ignore: avoid_print
      print("this is error ");
    }
  }

  // reset password
  Future<void> resetPassword({
    required String code,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      var body = {
        'password': password,
        'password_confirmation': confirmpassword,
        'token': code
      };
      final response = await apiService.resetPassword(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);
        Get.to(() => Login());

        AppConstant.showCustomSnackBar("Password Reset Successfully",
            isError: false);
      } else if (response.statusCode == 400) {
        updateValue(load: false);

        AppConstant.showCustomSnackBar(
            "Password and confirm password not matched",
            isError: false);
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);

      // ignore: avoid_print
      print("this is error ");
    }
  }
}

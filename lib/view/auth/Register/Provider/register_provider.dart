import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../../../../utils/app_constant.dart';
import '../../Login/View/login_view.dart';

class RegisterProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required String registerfor}) async {
    updateValue(load: true);
    try {
      var body = {
        'name': name,
        'email': email,
        'password': password,
        'registration_for': registerfor,
        'password_confirmation': confirmPassword
      };
      final response = await apiService.registration(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200 || response.statusCode == 201) {
        updateValue(load: false);
        AppConstant.showCustomSnackBar("Register Successfully", isError: false);
        Get.off(() => Login(
              email: email,
              password: password,
            ));
      } else {
        updateValue(load: false);
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      print("this is error ");
    }
  }
}

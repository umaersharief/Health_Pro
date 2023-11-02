import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../../../../utils/app_constant.dart';

class ChangePasswordProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    updateValue(load: true);
    try {
      var body = {'old_password': oldPassword, 'new_password': newPassword};
      final response = await apiService.changePassword(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);
        AppConstant.showCustomSnackBar("Password Changed Successfully",
            isError: false);
      } else if (response.statusCode == 422) {
        updateValue(load: false);
        AppConstant.showCustomSnackBar("Old Password doesn't match!",
            isError: true);
        // Get.to(() => const Profilescreen());
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

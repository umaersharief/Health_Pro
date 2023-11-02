import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_constant.dart';
import 'package:health_pro/view/auth/Login/View/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../BottomNavbar/bottom_navbar.dart';

class SplashProvider extends ChangeNotifier {
  void splashprovider({required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString(AppConstant.saveUserToken) != null) {
      AppConstant.getUserToken =
          sharedPreferences.getString(AppConstant.saveUserToken)!;
      AppConstant.getUserID =
          sharedPreferences.getString(AppConstant.saveUserID)!;

      Get.offAll(() => BottomNavbar(0));
    } else {
      Get.offAll(() => Login());
    }
  }
}

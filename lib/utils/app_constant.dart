import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AppConstant {
  //Todo store in local
  static String saveUserToken = 'saveUserToken';
  static String saveUserID = 'saveUserID';
  //Todo
  static String getUserToken = '';
  static String getUserID = '';

  static flutterToastError({required String message}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  static flutterToastSuccess({required String message}) =>
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

  static showCustomSnackBar(String message, {bool isError = true}) {
    if (message.isNotEmpty) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        message: message,
        maxWidth: double.maxFinite,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(15.w),
        borderRadius: 10,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ));
    }
  }
}

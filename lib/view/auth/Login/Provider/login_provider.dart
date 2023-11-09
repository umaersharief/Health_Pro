import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_constant.dart';
import '../../../BottomNavbar/bottom_navbar.dart';

class LogInProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();
  Future<void> login({
    required String email,
    required String password,
  }) async {
    updateValue(load: true);
    try {
      var body = {'email': email, 'password': password};
      final response = await apiService.login(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);
        Map<String, dynamic> map = jsonDecode(response.toString());

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();

        sharedPreferences.setString(
            AppConstant.saveUserToken, map['token'].toString());
        sharedPreferences.setString(
            AppConstant.saveUserID, map['id'].toString());

        AppConstant.getUserToken = map['token'].toString();
        AppConstant.getUserID = map['id'].toString();

        // ignore: avoid_print
        print(
            " User Token  *${AppConstant.getUserToken}*******User ID******${AppConstant.getUserID}******");

        AppConstant.showCustomSnackBar("Welcome Back", isError: false);
        Get.offAll(() => BottomNavbar(0));
      } else {
        Map<String, dynamic> map = jsonDecode(response.toString());

        // ignore: avoid_print
        print("this is error in dio ${map['errors'].toString()}");
        updateValue(load: false);
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      print("this is error   $error ");
    }
  }

//*****************************************************************************
//                           Google Login
//*****************************************************************************

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;
  Auth.User? loginUser;

  Future<Auth.User> signInWithGoogle(
    context,
  ) async {
    updateValue(load: true);
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      UserCredential authResult = await auth.signInWithCredential(credential);
      loginUser = authResult.user;

      if (loginUser != null) {
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        String? fcmToken = await messaging.getToken();
        print('FCM Token: $fcmToken');
        googleSignUp(
          google_id: loginUser!.uid,
          email: loginUser!.email!,
          name: loginUser!.displayName!,
          provider: "facebook / google",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
    }
    return loginUser!;
  }
  // void googleLogin() async {
  //   updateValue(load: true);
  //   GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  //   try {
  //     await googleSignIn.signIn();
  //     GoogleSignInAuthentication googleAuth =
  //         await googleSignIn.currentUser!.authentication;

  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(
  //       GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       ),
  //     );

  //     // Request FCM token

  //     googleSignUp(
  //       google_id: userCredential.user!.uid,
  //       email: userCredential.user!.email!,
  //       name: userCredential.user!.displayName!,
  //       provider: "facebook / google",
  //     );
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> googleSignUp({
    required String email,
    required String google_id,
    required String provider,
    required String name,
  }) async {
    updateValue(load: true);
    try {
      var body = {
        'name': name,
        'email': email,
        'provider': provider,
        'provider_id': google_id
      };
      final response = await apiService.socialLogin(params: body);

      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        updateValue(load: false);
        Map<String, dynamic> map = jsonDecode(response.toString());

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();

        sharedPreferences.setString(
            AppConstant.saveUserToken, map['token'].toString());
        sharedPreferences.setString(
            AppConstant.saveUserID, map['id'].toString());

        AppConstant.getUserToken = map['token'].toString();
        AppConstant.getUserID = map['id'].toString();

        // ignore: avoid_print
        print(
            " User Token  *${AppConstant.getUserToken}*******User ID******${AppConstant.getUserID}******");

        AppConstant.showCustomSnackBar("Welcome Back", isError: false);
        Get.offAll(() => BottomNavbar(0));

        notifyListeners();
      } else {
        updateValue(load: false);

        notifyListeners();
      }
    } catch (e) {
      updateValue(load: false);
      print('API exception');
      print(e.toString());
    }
  }
}

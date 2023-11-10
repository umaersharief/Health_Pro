import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/view/CardDetails/Provider/pandetails_provider.dart';
import 'package:health_pro/view/Cardregistration/Provider/cardregister_provider.dart';
import 'package:health_pro/view/Contactus/Provider/teamcontact_provider.dart';
import 'package:health_pro/view/Mypassword/Provider/changpassword_provider.dart';
import 'package:health_pro/view/Splash/Provider/splash_provider.dart';
import 'package:health_pro/view/UserProfile/Provider/editprofile_provider.dart';
import 'package:health_pro/view/UserProfile/Provider/userprofile_provider.dart';
import 'package:health_pro/view/Regcarddetails/Provider/myplan_provider.dart';
import 'package:health_pro/view/Splashscreen/splash_screen.dart';
import 'package:health_pro/view/auth/ForgetPassword/Provider/forgetpassword_provider.dart';
import 'package:health_pro/view/auth/Login/Provider/login_provider.dart';
import 'package:health_pro/view/auth/Register/Provider/register_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'firebase_options.dart';
import 'view/auth/Login/Provider/logout_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // designSize: const Size(384, 812),
      builder: (context, child) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => SplashProvider()),
              ChangeNotifierProvider(create: (_) => LogInProvider()),
              ChangeNotifierProvider(create: (_) => RegisterProvider()),
              ChangeNotifierProvider(create: (_) => LogoutProvider()),
              ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
              // ChangeNotifierProvider(create: (_) => Ho meProvider()),
              ChangeNotifierProvider(create: (_) => UserProfileProvider()),
              // ChangeNotifierProvider(create: (_) => ClinicDetailProvider()),
              ChangeNotifierProvider(create: (_) => CareCardRegiterProvider()),
              ChangeNotifierProvider(create: (_) => MyPlanProvider()),
              ChangeNotifierProvider(create: (_) => TeamContactProvider()),
              ChangeNotifierProvider(create: (_) => EdittProfileProvider()),
              ChangeNotifierProvider(create: (_) => ForgetPasswordProvider()),
              ChangeNotifierProvider(create: (_) => PlanDetailsProvider()),
            ],
            child: GetMaterialApp(
              theme: ThemeData(
                fontFamily: 'Poppins',
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            ));
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

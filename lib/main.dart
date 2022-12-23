import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meds_future/routes.dart';
import 'package:meds_future/screens/auth/pages/register_page.dart';
import 'package:meds_future/screens/home/home.screen.dart';
import 'package:meds_future/screens/splash/splash_screen.dart';
import 'package:meds_future/theme.dart';

import 'screens/auth/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: const SplashScreen(),
      // initialRoute: SplashScreen.routeName,
      routes: routes,

      getPages: [
        GetPage(name: '/home', page: (() => Home())),
        GetPage(name: '/', page: (() => SplashScreen())),
        GetPage(name: '/register', page: (() => RegisterPage())),
        GetPage(name: '/login', page: (() => LoginPage())),
      ],
    );
  }
}

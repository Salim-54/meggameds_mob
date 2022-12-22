import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meds_future/routes.dart';
import 'package:meds_future/screens/home/home.screen.dart';
import 'package:meds_future/screens/splash/splash_screen.dart';
import 'package:meds_future/theme.dart';

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
        GetPage(name: '/', page: (() => Home())),
        GetPage(name: '/home', page: (() => SplashScreen()))
      ],
    );
  }
}

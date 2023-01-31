import 'package:MMEDES/screens/splash.dart';
import 'package:flutter/material.dart';

import '/screens/splash/splash_screen.dart';
import 'screens/auth/pages/login_page.dart';
import 'screens/home/home.screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),
  Home.routeName: (context) => Home(),
  SplashScreenNew.routeName: (context) => SplashScreenNew(),
};

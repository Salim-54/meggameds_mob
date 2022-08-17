import 'package:flutter/material.dart';
import 'package:meds_future/screens/forget_password/forget_screen.dart';
import 'package:meds_future/screens/sign_in/sign_in_screen.dart';
import 'package:meds_future/screens/sign_up/sign_up_screen.dart';
import 'package:meds_future/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};

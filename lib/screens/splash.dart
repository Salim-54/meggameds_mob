import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/auth/pages/login_page.dart';

import '../providers/authentication.dart';

import '../size_constants.dart';

import 'home/home.screen.dart';
import 'splash/splash_screen.dart';

class SplashScreenNew extends StatefulWidget {
  static String routeName = "/welcome";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenNewState();
  }
}

class _SplashScreenNewState extends State<SplashScreenNew> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Hero(
                  tag: "logo-image",
                  child: SizedBox(
                    width: 200,
                    child: Image.asset(
                      "assets/images/logo_splash.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Copyright ⒸMega meds 2022",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
                /* const SizedBox(height: 10),
                const Center(
                    child: Text(
                  "Copyright Ⓒ  BasePay 2022",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: CustomColor.LIGHT_GREY_3),
                ))*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    print("Start timer");
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  Future<void> navigateUser() async {
    Provider.of<AuthProvider>(context, listen: false)
        .tryAutoLogin()
        .then((value) async {
      final isAuth = Provider.of<AuthProvider>(context, listen: false).isAuth;
      if (!isAuth) {
        Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        return;
      } else
        Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }
}

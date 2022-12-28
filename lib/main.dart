import 'package:MMEDES/screens/splash.dart';
import 'package:MMEDES/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import './routes.dart';
import '/screens/auth/pages/register_page.dart';
import '/screens/home/home.screen.dart';
import '/screens/splash/splash_screen.dart';
import './theme.dart';

import 'providers/authentication.dart';
import 'providers/medicine.dart';
import 'providers/start_transaction.dart';
import 'screens/auth/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.options.baseUrl = Constants.BASE_URL;

    // SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(dio)),
        ChangeNotifierProvider(create: (_) => StartTransaction(dio)),
        ChangeNotifierProvider(create: (_) => ProductsProvider(dio)),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: const SplashScreen(),
        // initialRoute: SplashScreen.routeName,
        routes: routes,

        getPages: [
          GetPage(name: '/home', page: (() => Home())),
          GetPage(name: '/', page: (() => SplashScreenNew())),
          GetPage(name: '/kafka', page: (() => SplashScreen())),
          GetPage(name: '/register', page: (() => RegisterPage())),
          GetPage(name: '/login', page: (() => LoginPage())),
        ],
      ),
    );
  }
}

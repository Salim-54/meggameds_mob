import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meds_future/screens/pharmacy/shop/pharmacy.screen.dart';
import 'package:meds_future/size_constants.dart';

import '../../constants.dart';
import '../prescriptons/components/search.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> screens = [
    Body(),
    Container(
      color: Colors.red,
      child: SearchWidget(),
    ),
    PharmacyScreen(),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: getProportionateScreenHeight(80),
      //   // leading: BackButton(
      //   //   color: Colors.black,
      //   // ),
      //   backgroundColor: sThirdColor,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     "HOME",
      //     style: TextStyle(color: sWhite),
      //   ),
      //   actions: [
      //     CircleAvatar(
      //       radius: 20,
      //       backgroundColor: Color(0xFFE3E2E3),
      //       child: SvgPicture.asset(
      //         "assets/icons/heart.svg",
      //         width: 25,
      //         height: 25,
      //       ),
      //     ),
      //     SizedBox(width: defaultPadding),
      //   ],
      // ),
      body: Center(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              print(index);
            });
          },
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: sWhite,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;

          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );

          print(index);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: sPrimaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: sPrimaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: sPrimaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: sPrimaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
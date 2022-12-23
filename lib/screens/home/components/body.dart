import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_constants.dart';
import 'my_app_bar.dart';
import 'my_tab.dart';
import 'tabs/recent.dart';
import 'tabs/top.dart';
import 'tabs/trending.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // user tapped searched button
  void searchButtonTapped() {}

  // tab options
  List tabOption = [
    ["Recent", RecentTab()],
    ["Trending", TrendingTab()],
    ["Top", TopTab()],
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        body: ListView(
          children: [
            // title + search button
            MyAppBar(
              title: 'Track Our Moves',
              onSearchTap: searchButtonTapped,
            ),

            // tab bar
            SizedBox(
              height: getProportionateScreenHeight(541.5),
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

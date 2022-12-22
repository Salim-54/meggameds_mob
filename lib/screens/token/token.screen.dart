import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/my_app_bar.dart';

class Token extends StatefulWidget {
  const Token({Key? key}) : super(key: key);

  @override
  State<Token> createState() => _TokenState();
}

class _TokenState extends State<Token> {
  // user tapped searched button
  void searchButtonTapped() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        body: ListView(
          children: [
            // title + search button
            MyAppBar(
              title: 'Check token Validity',
              onSearchTap: searchButtonTapped,
            ),

            // tab bar
            SizedBox(
                height: 600,
                child: Container(
                  color: sThirdColor,
                )),
          ],
        ),
      ),
    );
  }
}

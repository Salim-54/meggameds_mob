import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meds_future/controller/search/token.controller.dart';
import 'package:meds_future/size_constants.dart';

import '../../constants.dart';

import 'components/history.dart';
import 'components/medical.dart';
import 'components/my_app_bar.dart';
import 'components/profile.dart';

class Settings extends StatelessWidget {
  TokenController expand_search = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sThirdColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // title + search button
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(31.4)),
              child: MyAppBar(
                title: 'Your Health updates',
                onSearchTap: () {},
              ),
            ),

            // tab bar
            SizedBox(
                height: getProportionateScreenHeight(541.5),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SearchWidget(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: 5,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Profile(),
                              Medical(),
                              History(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  color: Colors.grey[300],
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meds_future/controller/search/token.controller.dart';
import 'package:meds_future/size_constants.dart';

import '../../constants.dart';
// import '../prescriptons/components/search.dart';
import '../prescriptons/components/search.dart';
import 'components/my_app_bar.dart';

class Token extends StatelessWidget {
  TokenController expand_search = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // title + search button
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(31.4)),
            child: MyAppBar(
              title: 'Check token Validity',
              onSearchTap: () {},
            ),
          ),

          // tab bar
          SizedBox(
              height: getProportionateScreenHeight(541.5),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchWidget(),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Token validation here!!!",
                          style: GoogleFonts.mina(color: sWhite, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
                color: sThirdColor,
              )),
        ],
      ),
    );
  }
}

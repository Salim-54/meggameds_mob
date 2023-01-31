import 'dart:ui';

import 'package:MMEDES/screens/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/register.controller.dart';
import '../../../providers/authentication.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';
import 'row_info.dart';

class Profile extends StatelessWidget {
  EnterController credentials = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "PROFILE",
                style: GoogleFonts.mina(
                  color: sPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  Provider.of<AuthProvider>(context, listen: false).logout();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                    ModalRoute.withName("/login"),
                  );
                },
                child: Container(
                  height: getProportionateScreenHeight(35),
                  width: getProportionateScreenWidth(100),
                  decoration: BoxDecoration(
                    color: sPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: sWhite, fontSize: 16, fontFamily: 'Muli'),
                      ),
                      Icon(
                        Icons.logout_rounded,
                        color: sWhite,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: getProportionateScreenHeight(75),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultPadding * 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: sThirdColor,
                  radius: 30,
                  child: Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Colors.grey[300],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      RowInfo(
                        key_s: "Name",
                        value:
                            "${credentials.f_name.value} ${credentials.l_name.value} ",
                      ),
                      RowInfo(
                        key_s: "Tel",
                        value: "+${credentials.phone.value}",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

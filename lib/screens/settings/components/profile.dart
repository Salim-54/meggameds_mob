import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';
import 'row_info.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "PROFILE",
            style: GoogleFonts.mina(
              color: sPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: getProportionateScreenHeight(100),
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
                        value: "NDAYISABYE Salim",
                      ),
                      RowInfo(
                        key_s: "ID",
                        value: "11 9998 00355 35800dddddddd",
                      ),
                      RowInfo(
                        key_s: "Tel",
                        value: "+250 789 393 544",
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meds_future/size_constants.dart';

import '../../../constants.dart';
import 'row_medical.dart';

class Medical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "MEDICAL RECORDS",
            style: GoogleFonts.mina(
              color: sPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5),
          width: double.infinity,
          height: getProportionateScreenHeight(140),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultPadding * 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: RowMed(
                    key_s: "Weight",
                    value: "71",
                    day: "3 days ago",
                  ),
                ),
                RowMed(
                  key_s: "Height",
                  day: "3 days ago",
                  value: "45",
                ),
                RowMed(
                  key_s: "Blood pressure",
                  day: "3 days ago",
                  value: "23",
                ),
                RowMed(
                  key_s: "Temperature",
                  day: "3 days ago",
                  value: "23",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

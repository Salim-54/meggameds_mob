import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meds_future/size_constants.dart';

import '../../../constants.dart';
import 'row_medical.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "PAYMENT HISTORY",
            style: GoogleFonts.mina(
              color: sPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: getProportionateScreenHeight(160),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No history yet",
                  style: GoogleFonts.mina(
                    color: sTextBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
                // RowMed(
                //   key_s: "Height",
                //   day: "3 days ago",
                //   value: "45",
                // ),
                // RowMed(
                //   key_s: "Blood pressure",
                //   day: "3 days ago",
                //   value: "23",
                // ),
                // RowMed(
                //   key_s: "Temperature",
                //   day: "3 days ago",
                //   value: "23",
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

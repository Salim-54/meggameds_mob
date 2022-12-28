import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';
import 'row_history.dart';
import 'row_medical.dart';

// Container(
//   height: getProportionateScreenHeight(225),
//   color: sOtherBg,
//   child: SingleChildScrollView(
//     child: Column(
//       children: [],
//     ),
//   ),
// )
//
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RowHistory(
                      token: '55544', type: 'generic', place: 1, paid: true),
                  RowHistory(
                      token: '55544', type: 'generic', place: 1, paid: false),
                  RowHistory(
                      token: '55544', type: 'sensitive', place: 1, paid: false),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

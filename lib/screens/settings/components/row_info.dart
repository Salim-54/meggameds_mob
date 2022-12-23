import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meds_future/size_constants.dart';

import '../../../constants.dart';

class RowInfo extends StatelessWidget {
  RowInfo({
    Key? key,
    required this.key_s,
    required this.value,
  }) : super(key: key);
  final String key_s;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(25)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              key_s,
                              style: GoogleFonts.mina(
                                color: sTextBlackColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            ":",
                            style: GoogleFonts.mina(
                              color: sTextBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: GoogleFonts.mina(
                          color: sTextBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

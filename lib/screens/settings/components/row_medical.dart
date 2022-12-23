import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';

class RowMed extends StatelessWidget {
  RowMed({
    Key? key,
    required this.key_s,
    required this.value,
    required this.day,
  }) : super(key: key);
  final String key_s;
  final String value;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
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
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
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
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    child: Text(
                      day,
                      style: GoogleFonts.mina(
                        color: sTextBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

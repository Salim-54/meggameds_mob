import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';

class RowHistory extends StatelessWidget {
  RowHistory({
    Key? key,
    required this.token,
    required this.type,
    required this.paid,
    required this.place,
  }) : super(key: key);
  final String token;
  final int place;
  final String type;
  final bool paid;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${place}.  ',
                style: GoogleFonts.mina(
                  color: sTextBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          token,
                          style: GoogleFonts.mina(
                            color: sTextBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        type,
                        style: GoogleFonts.mina(
                          color: sTextBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
                    paid ? 'paid' : 'not-paid',
                    style: GoogleFonts.mina(
                      color: paid ? sSuccessColor : sTextBlackColor,
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
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        height: getProportionateScreenHeight(25),
                        width: getProportionateScreenWidth(80),
                        decoration: BoxDecoration(
                          color: paid ? sTextGreyColor : sPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Buy',
                              style: TextStyle(
                                  color: sWhite,
                                  fontSize: 14,
                                  fontFamily: 'Muli'),
                            ),
                            Icon(
                              Icons.euro_rounded,
                              color: sWhite,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

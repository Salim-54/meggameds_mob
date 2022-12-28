import 'dart:ffi';

import 'package:MMEDES/screens/settings/model/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';

class RowHistory extends StatelessWidget {
  RowHistory({
    Key? key,
    required this.payment,
    required this.press,
    required this.index,
  }) : super(key: key);
  final Payment payment;
  final VoidCallback press;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(payment.id),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${index + 1}.  ',
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
                          payment.token.toString(),
                          style: GoogleFonts.mina(
                            color: sTextBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        payment.type,
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
                    payment.payment,
                    style: GoogleFonts.mina(
                      color: payment.payment == 'paid'
                          ? sSuccessColor
                          : sTextBlackColor,
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
                      onPressed: payment.payment == 'paid' ? () {} : press,
                      child: Container(
                        height: getProportionateScreenHeight(25),
                        width: getProportionateScreenWidth(80),
                        decoration: BoxDecoration(
                          color: payment.payment != 'paid'
                              ? sTextGreyColor
                              : sPrimaryColor,
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

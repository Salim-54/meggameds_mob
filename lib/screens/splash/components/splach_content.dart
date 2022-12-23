import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/size_constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 2),
        Text(
          "MEGGAMEDS",
          // style: TextStyle(
          // color: sPrimaryColor,
          //   fontSize: getProportionateScreenHeight(36),
          //   fontWeight: FontWeight.bold,
          // letterSpacing: 2,
          // ),
          style: GoogleFonts.bebasNeue(
            letterSpacing: 2,
            color: sPrimaryColor,
            fontSize: 52,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenHeight(70),
            right: getProportionateScreenHeight(40),
          ),
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              wordSpacing: 5,
            ),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(bottom: 28),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: sThirdColor,
                offset: Offset(0.0, 0.01),
                blurRadius: 15.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(
              image,
              height: getProportionateScreenHeight(270),
              width: getProportionateScreenWidth(250),
            ),
          ),
        )
      ],
    );
  }
}

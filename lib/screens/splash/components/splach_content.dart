import 'package:flutter/material.dart';
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
          "MEGGAMED",
          style: TextStyle(
            color: sPrimaryColor,
            fontSize: getProportionateScreenHeight(36),
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(35)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              wordSpacing: 5,
            ),
          ),
        ),
        Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(270),
          width: getProportionateScreenWidth(250),
        )
      ],
    );
  }
}

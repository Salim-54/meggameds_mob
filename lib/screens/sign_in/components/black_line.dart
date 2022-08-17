import 'package:flutter/material.dart';
import 'package:meds_future/size_constants.dart';

class BlackLine extends StatelessWidget {
  const BlackLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(55),
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(27)),
      width: getProportionateScreenWidth(70),
      child: Container(
        // height: 2,
        color: Colors.black,
      ),
      // color: sPrimaryColor,
    );
  }
}

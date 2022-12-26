import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_constants.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
    required this.iconColor,
  }) : super(key: key);
  final String svgIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(15),
          getProportionateScreenWidth(15), getProportionateScreenWidth(15)),
      child: SvgPicture.asset(svgIcon,
          height: getProportionateScreenHeight(18), color: iconColor),
    );
  }
}

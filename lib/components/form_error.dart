import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/size_constants.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);
  final List errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => Row(
          children: [
            SvgPicture.asset(
              "assets/icons/Error.svg",
              color: sErrorColor,
              height: getProportionateScreenHeight(16),
              width: getProportionateScreenWidth(16),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              errors[index],
              style: TextStyle(color: sErrorColor),
            )
          ],
        ),
      ),
    );
  }
}

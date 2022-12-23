import 'package:flutter/material.dart';
import 'package:meds_future/constants.dart';

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Rwf ",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w600, color: sPrimaryColor),
        children: [
          TextSpan(
            text: amount,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}

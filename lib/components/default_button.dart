import 'package:flutter/material.dart';

import '../constants.dart';

class DefaulButton extends StatelessWidget {
  const DefaulButton({
    Key? key,
    required this.disabled,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool disabled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 0,
            shadowColor: null,
            primary: disabled ? sDisabledColor : sPrimaryColor,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontFamily: "Muli", fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

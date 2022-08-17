import 'package:flutter/material.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/screens/sign_in/sign_in_screen.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.disabled,
  }) : super(key: key);

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
          shadowColor: null,
          primary: disabled ? sDisabledColor : sPrimaryColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        if (disabled == false) {
          Navigator.pushNamed(context, SignInScreen.routeName);
        } else {
          return null;
        }
      },
      child: Text(
        "Continue",
        style: TextStyle(fontFamily: "Muli", fontWeight: FontWeight.bold),
      ),
    );
  }
}

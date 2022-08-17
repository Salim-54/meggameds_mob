import 'package:flutter/material.dart';

const sPrimaryColor = Color(0xFF189CC6);
const sPrimaryLightColor = Color(0xFFFFFFF);
const sPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF189CC6), Color(0xFF189CC6)],
);
const sDisabledColor = Color(0xFFB4D9F2);
const sTextBlackColor = Color(0xFF212529);
const sTextGreyColor = Color(0xFF868E96);
const sDisabledGreyColor = Color(0xFFD8D8D8);
const sSuccessColor = Color(0xFF3CAF47);
const sGreyBg = Color(0xFFF5F5F5);
const sErrorColor = Color(0xFFFF5C5C);
const sGreenColor = Color(0xFFF81AA66);
const sAnimationDuration = Duration(milliseconds: 200);

//reg exp :
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String sEmailNullError = "Please Enter your email";
const String sInvalidEmailError = "Please Enter Valid Email";
const String sPassNullError = "Please Enter your password";
const String sShortPassError = "Password is too short";
const String sMatchPassError = "Passwords don't match";
const String sNamelNullError = "Please Enter your name";
const String sPhoneNumberNullError = "Please Enter your phone number";
const String sAddressNullError = "Please Enter your address";

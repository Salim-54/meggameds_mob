import 'package:flutter/material.dart';

const sPrimaryColor = Color(0xFF189CC6);
const sOtherColor = Color.fromARGB(255, 91, 207, 243);
const sThirdColor = Color.fromARGB(154, 24, 157, 198);

const sPrimaryLightColor = Color(0xFFFFFFF);
const sPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF189CC6), Color(0xFF189CC6)],
);
var backgroundColor = Colors.grey[300];
var tabTextStyle = TextStyle(color: Colors.grey[600]);
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

const sOtherGreyColor = Color.fromARGB(255, 240, 248, 243);
const sBgColor = Color(0xFFF3F3F3);
const sWhite = Color(0xFFFFFFFF);

const sOtherGreen = Color(0xFF37B172);
const sSpinner = Color.fromARGB(255, 125, 241, 181);
const sSpinnerBg = Color.fromARGB(99, 56, 224, 137);
const sOtherBg = Color(0xFFF7F7FC);
const sTabInactive = Color(0xFF4C5858);

final RegExp phoneValidatorRegExp = RegExp(r"^(?:[+0])?[0-9]{10}$");
const String sFirstNameNullError = "Please enter your First name ";
const String sLastNameNullError = "Please enter your Last name";

const String sInvalidPhoneError = "Please Enter Valid Phone number";

const defaultPadding = 20.0;
const cartBarHeight = 100.0;
const headerHeight = 85.0;

const bgColor = Color(0xFFF6F5F2);
const primaryColor = Color(0xFF40A944);

const panelTransition = Duration(milliseconds: 500);

AppBar buildAppBar(String title, Icon icon) {
  return AppBar(
    leading: BackButton(
      color: sTextBlackColor,
    ),
    backgroundColor: sOtherBg,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: sTextBlackColor),
    ),
    actions: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xFFE3E2E3),
        child: icon,
      ),
      SizedBox(width: defaultPadding),
    ],
  );
}

AppBar categoryAppBar(Widget title) {
  return AppBar(
    leading: BackButton(
      color: sTextBlackColor,
    ),
    backgroundColor: sOtherBg,
    elevation: 0,
    centerTitle: true,
    title: title,
  );
}

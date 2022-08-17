import 'package:flutter/material.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/screens/sign_up/sign_up_screen.dart';
import 'package:meds_future/size_constants.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?"),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RegisterScreen.routeName),
            child: Text(
              "Register",
              style: TextStyle(color: sPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../size_constants.dart';

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
          Text(
            "Register",
            style: TextStyle(color: sPrimaryColor),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meds_future/components/register_link.dart';
import 'package:meds_future/screens/sign_in/components/black_line.dart';
import 'package:meds_future/screens/sign_in/components/sign_in.dart';
import 'package:meds_future/size_constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenHeight(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login with email and password \nor just continue with your social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(35),
                ),
                LogInForm(),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                RegisterLink(),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(70)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlackLine(),
                        Spacer(),
                        Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Muli",
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Spacer(),
                        BlackLine(),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(160, 224, 238, 246),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/icons/google-icon.svg"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

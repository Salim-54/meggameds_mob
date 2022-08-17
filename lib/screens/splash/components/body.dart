import 'package:flutter/material.dart';
import 'package:meds_future/components/default_button.dart';
import 'package:meds_future/constants.dart';
import 'package:meds_future/screens/sign_in/sign_in_screen.dart';
import 'package:meds_future/screens/splash/components/splach_content.dart';
import 'package:meds_future/size_constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentSplash = 0;
  bool disabled = true;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashContents = [
      {
        "text":
            "Welcome to meggamed ecosystem where perfect medical health is wish but realiy",
        "image": "assets/images/pharmacy.png"
      },
      {
        "text":
            "Have you ever fill so dissy to do anything where   is no longer a wish but realiy",
        "image": "assets/images/sickness.jpg"
      },
      {
        "text":
            "Join the ecosystem where perfect medical health is no longer a wish but realiy",
        "image": "assets/images/pharmacy.png"
      },
    ];
    return SizedBox(
      child: Column(
        children: [
          Spacer(),
          Expanded(
              flex: 5,
              child: PageView.builder(
                itemCount: splashContents.length,
                onPageChanged: (value) {
                  if (value == splashContents.length - 1) {
                    setState(() {
                      disabled = false;
                    });
                  } else {
                    disabled = true;
                  }
                  setState(() {
                    currentSplash = value;
                  });
                },
                itemBuilder: ((context, index) => SplashContent(
                      image: splashContents[index]['image'].toString(),
                      text: splashContents[index]['text'].toString(),
                    )),
              )),
          Spacer(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(27)),
              child: Column(
                children: [
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashContents.length, (index) => BuildDot(index)),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: DefaulButton(
                      disabled: disabled,
                      text: "Continue",
                      press: () {
                        if (disabled == false) {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer BuildDot(int index) {
    return AnimatedContainer(
      duration: sAnimationDuration,
      margin: EdgeInsets.only(right: 3),
      height: 6,
      width: currentSplash == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentSplash == index ? sPrimaryColor : sDisabledGreyColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

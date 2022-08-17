import 'package:flutter/material.dart';
import 'package:meds_future/size_constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(28)),
          child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenHeight(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "You are so welcomed to this modern\n way of getting your prescription\n fulfilled in seconds.",
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

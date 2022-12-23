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

class MyButton extends StatelessWidget {
  const MyButton({
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
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: disabled ? sDisabledColor : sPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

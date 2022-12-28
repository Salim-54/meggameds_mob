import 'package:flutter/material.dart';

import '../constants.dart';

void showSnackbar(BuildContext context, String message, {type = "success"}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: 1),
    dismissDirection: DismissDirection.up,
    content: Text("$message"),
    backgroundColor: type == "success" ? sOtherGreen : sErrorColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void snackDirect(
  BuildContext context,
  String message,
) {
  var snackBar = SnackBar(
    duration: Duration(seconds: 1),
    dismissDirection: DismissDirection.up,
    content: Text(
      "$message",
      style: TextStyle(color: sWhite),
    ),
    backgroundColor: sThirdColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

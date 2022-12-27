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

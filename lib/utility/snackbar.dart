import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message,
    {Color backgroundColor = const Color(0xff259625)}) {
  var snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

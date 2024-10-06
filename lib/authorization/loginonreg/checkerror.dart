import 'package:flutter/material.dart';

String checkerror(String error, NavigatorState navigator, final update) {
  if (error == 'nice') {
    navigator.pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
  } else if (error == "mail-check") {
    navigator.pushNamedAndRemoveUntil(
        "/mailverif", (Route<dynamic> route) => false);
  } else {
    update();
    return error;
  }
  return error;
}

import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';

Widget appTextField(BuildContext context, TextEditingController controller,
    bool password, String hint) {
  return Container(
    decoration:
        BoxDecoration(color: field, borderRadius: BorderRadius.circular(15)),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width * 0.8,
    height: MediaQuery.of(context).size.height * 0.06,
    child: TextFormField(
      textInputAction: TextInputAction.next,
      obscureText: password,
      controller: controller,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) *
            0.02,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: (MediaQuery.of(context).size.width +
                  MediaQuery.of(context).size.height) *
              0.02,
          color: const Color.fromRGBO(241, 241, 241, 1),
        ),
        hintText: hint,
      ),
    ),
  );
}

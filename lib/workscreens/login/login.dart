import 'package:flutter/material.dart';
import 'package:taskmanager/workscreens/login/button_auth.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/workscreens/login/textfield.dart';

import '../../manageuser/loginorregister.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool load = false;
TextEditingController mail = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginState extends State<Login> {
  String errorStr = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backGroundcolor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flutter Task Manager",
                  style: titleTextStyle, textAlign: TextAlign.center),
              SizedBox(height: height * 0.15),
              appTextField(context, mail, false, "Почта"),
              SizedBox(height: height * 0.02),
              appTextField(context, password, true, "Пароль"),
              SizedBox(
                height: height * 0.02,
              ),
              if (errorStr != "")
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(errorStr, style: appErrorStyle),
                ),
              load == false
                  ? GestureDetector(
                      onTap: () async {
                        setState(() {
                          load = true;
                        });
                        String? result =
                            await loginOrRegister(mail.text, password.text);
                        if (context.mounted) {
                          if (result == "home") {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/home", (Route<dynamic> route) => false);
                          } else if (result == "mail") {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/mailverif", (Route<dynamic> route) => false);
                          } else {
                            errorStr = result;
                            setState(() {});
                          }
                        }
                        mail.text = "";
                        password.text = "";
                        load = false;
                      },
                      child: buttonAuth("Войти"),
                    )
                  : const CircularProgressIndicator(),
              SizedBox(
                height: height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

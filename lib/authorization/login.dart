import 'package:flutter/material.dart';
import 'package:taskmanager/authorization/button_auth.dart';
import 'package:taskmanager/authorization/loginonreg/aunt.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String errorStr = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController mail = TextEditingController();
    TextEditingController password = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGroundcolor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Flutter Task Manager",
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.15,
              ),
              appTextField(context, mail, false, "Почта"),
              SizedBox(
                height: height * 0.02,
              ),
              appTextField(context, password, true, "Пароль"),
              SizedBox(
                height: height * 0.02,
              ),
              if (errorStr != "")
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(errorStr, style: appErrorStyle)),
              GestureDetector(
                  onTap: () => aunt(
                        mail.text,
                        password.text,
                        context,
                        (error) => setState(() {
                          errorStr = error;
                          print(error);
                        }),
                      ),
                  child: const ButtonAuth(hint: "Войти")),
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

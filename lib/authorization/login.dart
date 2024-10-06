import 'package:flutter/material.dart';
import 'package:taskmanager/authorization/button_auth.dart';
import 'package:taskmanager/authorization/loginonreg/aunt.dart';
import 'package:taskmanager/authorization/loginonreg/checkerror.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/widgets/textfield.dart';

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
    final navigator = Navigator.of(context);

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
              appTextField(
                context,
                mail,
                false,
                "Почта",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              appTextField(
                context,
                password,
                true,
                "Пароль",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              if (errorStr != "")
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(errorStr, style: appErrorStyle)),
              load == false
                  ? GestureDetector(
                      onTap: () async {
                        setState(() {
                          load = true;
                        });
                        errorStr = checkerror(
                            await aunt(mail.text, password.text, errorStr),
                            navigator,
                            () => setState(
                                () {})); // Получаем ошибку если есть, если нету то переходим дальше либо на проверку почты
                        mail.text = "";
                        password.text = "";
                        load = false;
                      },
                      child: const ButtonAuth(hint: "Войти"))
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

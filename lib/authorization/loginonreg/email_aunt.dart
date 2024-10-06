import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  bool lock = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      print(timer.tick);
      checkEmailVerified();
      if (timer.tick % 10 == 0) {
        lock = false;
      }
    });
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      // TODO: implement your code after email verification
      timer?.cancel();
      final navigator = Navigator.of(context);
      navigator.pushNamedAndRemoveUntil(
          "/home", (Route<dynamic> route) => false);
    }
  }

  @override
  void dispose() {
// TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backGroundcolor,
          actions: [
            GestureDetector(
              onTap: () async {
                timer?.cancel();
                await FirebaseAuth.instance.signOut();
                final navigator = Navigator.of(context);
                navigator.pushNamedAndRemoveUntil(
                    "/login", (Route<dynamic> route) => false);
              },
              child: const Icon(
                Icons.cancel,
                size: 30,
                color: Color.fromARGB(255, 207, 207, 207),
              ),
            )
          ],
        ),
        backgroundColor: backGroundcolor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Проверьте почту", style: appTextStyle)),
                SizedBox(height: heigtScreen * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                      child: Text(
                    'Мы отправили письмо на указанный Email ${auth.currentUser?.email}',
                    style: applowTextStyle,
                    textAlign: TextAlign.center,
                  )),
                ),
                const SizedBox(height: 16),
                const Center(child: CircularProgressIndicator()),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                      child: Text('Подтверждение почты...',
                          style: applowTextStyle)),
                ),
                const SizedBox(height: 57),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: GestureDetector(
                    child: SizedBox(
                      height: heigtScreen * 0.05,
                      width: widthScreen * 0.4,
                      child: Center(
                        child: Text(
                          'Повторить',
                          style: applowTextStyle,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (lock == false) {
                        print("Отправлено");
                        lock = true;
                        try {
                          FirebaseAuth.instance.currentUser
                              ?.sendEmailVerification();
                        } catch (e) {
                          debugPrint('$e');
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

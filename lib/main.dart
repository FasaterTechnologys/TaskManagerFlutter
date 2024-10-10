import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/managedata/managedata.dart';
import 'package:taskmanager/workscreens/login/login.dart';
import 'package:taskmanager/workscreens/mailverif/email_aunt.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/workscreens/home/home.dart';
import 'package:taskmanager/workscreens/profile/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        colorSchemeSeed: backGroundcolor,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/mailverif': (context) => const EmailVerificationScreen(),
      },
    );
  }
}

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heigtScreen = MediaQuery.of(context).size.height;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text('Что-то пошло не так!')));
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const EmailVerificationScreen();
          }
        } else if (snapshot.data == null) {
          return const Login();
        }
        return const Home();
      },
    );
  }
}

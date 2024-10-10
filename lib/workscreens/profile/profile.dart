import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/workscreens/profile/profilecontainer.dart';

import '../../scoffaldallscreen/scaffoldallscreen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAllScreen(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: heigtScreen * 0.06,
            ),
            ProfileContainer(() async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "/login", (Route<dynamic> route) => false);
              }
            }),
            SizedBox(
              height: heigtScreen * 0.1,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

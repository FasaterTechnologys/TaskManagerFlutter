import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/workscreens/profile/profilecontainer.dart';

import '../../scaffoldallscreen.dart';

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

              route(context, "/login");
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

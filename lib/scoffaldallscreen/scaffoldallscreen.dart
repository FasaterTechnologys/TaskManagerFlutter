import 'package:flutter/material.dart';
import 'package:taskmanager/manageuser/userfirebaseload.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/scoffaldallscreen/drawer.dart';

class ScaffoldAllScreen extends StatefulWidget {
  final Widget body;
  const ScaffoldAllScreen({required this.body, super.key});

  @override
  State<ScaffoldAllScreen> createState() => _ScaffoldAllScreenState();
}

class _ScaffoldAllScreenState extends State<ScaffoldAllScreen> {
  UserLoaded userLoaded = UserLoaded();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: widthScreen * 0.75,
        child: dawer(context),
      ),
      appBar: AppBar(
        backgroundColor: backGroundcolor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: widthScreen * 0.12,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      backgroundColor: backGroundcolor,
      body: FutureBuilder(
        future: userLoaded.loaduserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/login", (Route<dynamic> route) => false);
            return const SizedBox();
          } else {
            return widget.body;
          }
        },
      ),
    );
  }
}

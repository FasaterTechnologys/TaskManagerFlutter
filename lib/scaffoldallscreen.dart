import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/workscreens/drawer.dart';

class ScaffoldAllScreen extends StatefulWidget {
  final Widget body;
  const ScaffoldAllScreen({required this.body, super.key});

  @override
  State<ScaffoldAllScreen> createState() => _ScaffoldAllScreenState();
}

class _ScaffoldAllScreenState extends State<ScaffoldAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          width: widthScreen * 0.85,
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
        body: widget.body);
  }
}

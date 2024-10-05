import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/scaffoldallscreen.dart';
import 'package:taskmanager/workscreens/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAllScreen(
      body: Column(
        children: [
          SizedBox(
            height: heigtScreen * 0.05,
          ),

          const Spacer(),
          //appBar(context),
        ],
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';

/// Пример простейшей анимации

void main() {
  runApp(MyApp()); // запуск
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // отрисовка
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white, //тема
      ),
      debugShowCheckedModeBanner: false,
      home: const AnimExample(), // вызываем класс с хуйней
    );
  }
}

class AnimExample extends StatefulWidget {
  const AnimExample({super.key});

  @override
  State<AnimExample> createState() => _AnimExampleState();
}

class _AnimExampleState extends State<AnimExample>
    with SingleTickerProviderStateMixin<AnimExample> {
  //миксин
  late final _controller = AnimationController(
    vsync: this,
    duration: Durations.long4,
  )
    ..addListener(_update)
    ..addStatusListener(_checkStatus)
    ..forward(); //каскада ебать того рот

  late final _anim = _controller.view;

  bool _needToggleDirection = false;

  @override
  Widget build(BuildContext context) {
    GestureDetector(
      child: Icon(Icons.get_app, size: heigtScreen * 0.05, color: Colors.white),
      onTap: () async {
        DatabaseReference ref = FirebaseDatabase.instance.ref("users/айди");

        await ref.set({
          "name": "John",
          "age": 18,
          "address": {"line1": "100 Mountain View"}
        });
      },
    );

    GestureDetector(
      child:
          Icon(Icons.download, size: heigtScreen * 0.05, color: Colors.white),
      onTap: () async {
        final ref = FirebaseDatabase.instance.ref();
        final snapshot = await ref.child('users/айди').get();
        if (snapshot.exists) {
          print(snapshot.value);
        } else {
          print('No data available.');
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: _anim.value,
          child: GestureDetector(
            onTap: _needToggleDirection
                ? _controller.reverse
                : _controller.forward,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_update);
    _controller.removeStatusListener(_checkStatus);
    _controller.dispose();
    super.dispose();
  }

  void _update() => setState(() {});

  void _checkStatus(AnimationStatus status) {
    _needToggleDirection = status == AnimationStatus.completed;
  }
}

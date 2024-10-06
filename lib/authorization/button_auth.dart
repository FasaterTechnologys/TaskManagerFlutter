import 'package:flutter/material.dart';

class ButtonAuth extends StatefulWidget {
  final String hint;
  const ButtonAuth({super.key, required this.hint});

  @override
  State<ButtonAuth> createState() => _ButtonAuthState();
}

class _ButtonAuthState extends State<ButtonAuth>
    with SingleTickerProviderStateMixin<ButtonAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(44, 49, 59, 1),
              Color.fromRGBO(13, 14, 17, 1),
            ]),
        borderRadius: BorderRadius.circular(35),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Align(
        child: Text(
          widget.hint,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

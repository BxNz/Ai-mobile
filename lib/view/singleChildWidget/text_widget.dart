import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello world ${1}",
      style: TextStyle(
        fontSize: 20,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
        decorationThickness: 2,
        letterSpacing: 2,
        wordSpacing: 2,
        height: 2,
        shadows: [
          Shadow(color: Colors.black, blurRadius: 2, offset: Offset(2, 2)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 100, width: 100, color: Colors.amber),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 9, 73, 252),
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          right: 15,
          child: Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 70, 238, 4),
          ),
        ),
      ],
    );
  }
}

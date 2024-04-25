import 'package:flutter/material.dart';

class introducepage1 extends StatefulWidget {
  const introducepage1({super.key});

  @override
  State<introducepage1> createState() => _introducepage1();
}

class _introducepage1 extends State<introducepage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/shiba1.jpg",
          width: 400,
          height: 400,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "你渴望力量嗎",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}

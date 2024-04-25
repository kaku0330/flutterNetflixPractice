import 'package:flutter/material.dart';

class introducepage2 extends StatefulWidget {
  const introducepage2({super.key});

  @override
  State<introducepage2> createState() => _introducepage2();
}

class _introducepage2 extends State<introducepage2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/shiba2.jpg",
          width: 400,
          height: 400,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "渴望的話就跟本柴一樣點SIGN IN吧",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}

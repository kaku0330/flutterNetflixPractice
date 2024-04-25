import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/pages/introducepage1.dart';
import 'package:testflutter/pages/introducepage2.dart';
import 'package:testflutter/pages/loginplayer.dart';

class introducepage extends StatefulWidget {
  const introducepage({super.key});

  @override
  State<introducepage> createState() => _introducepage();
}

class _introducepage extends State<introducepage> {
  late PageController _pageController;
  int _currentPage = 0;
  final int totalPage = 2;
  Color checkcolor = Colors.grey;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
        if (_currentPage == 1) {
          checkcolor = Colors.red;
        } else {
          checkcolor = Colors.grey;
        }
      });
    });
  }

  Widget _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < totalPage; i++) {
      indicators.add(
        Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.red : Colors.grey,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    children.add(introducepage1());
    children.add(introducepage2());

    return SafeArea(
        child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/netflix_logo.png",
              width: 150,
              height: 100,
            ),
            SizedBox(
              width: 180,
            ),
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "救救我啊我救我",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.black,
                      fontSize: 16.0);
                },
                child: Text(
                  "Privacy Help",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ))
          ],
        ),
        SizedBox(
          height: 680,
          child: PageView(
            controller: _pageController,
            children: children,
          ),
        ),
        _buildPageIndicator(),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 400,
          child: ElevatedButton(
            onPressed: () {
              if (_currentPage == 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const loginplayerpage()));
              }
            },
            child: Text(
              "SIGN IN",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: checkcolor,
            ),
          ),
        )
      ],
    ));
  }
}

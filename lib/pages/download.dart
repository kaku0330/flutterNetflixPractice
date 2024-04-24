import 'package:flutter/material.dart';
import 'package:testflutter/pages/commingsoon.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/more.dart';
import 'package:testflutter/pages/search.dart';

class downloadpage extends StatefulWidget {
  const downloadpage({super.key});

  @override
  State<downloadpage> createState() => _downloadpage();
}

class _downloadpage extends State<downloadpage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "無下載資料",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (value) {
            if (value == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const indexpage()));
            }
            if (value == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const searchpage()));
            }
            if (value == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const comingsoonpage()));
            }
            if (value == 4) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const morepage()));
            }
          },
          items: const [
            BottomNavigationBarItem(label: "首頁", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: "搜尋",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(label: "即將上線", icon: Icon(Icons.history)),
            BottomNavigationBarItem(label: "下載內容", icon: Icon(Icons.download)),
            BottomNavigationBarItem(label: "更多", icon: Icon(Icons.more_vert))
          ],
        ));
  }
}

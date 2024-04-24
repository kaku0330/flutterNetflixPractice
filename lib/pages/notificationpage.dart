import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/models/movienotification.dart';
import 'package:testflutter/pages/commingsoon.dart';
import 'package:testflutter/pages/download.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/more.dart';
import 'package:testflutter/pages/search.dart';

class notificationpage extends StatefulWidget {
  const notificationpage({super.key});

  @override
  State<notificationpage> createState() => _notificationpage();
}

class _notificationpage extends State<notificationpage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 440,
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 300),
                                    // 指定 pageBuilder
                                    pageBuilder: (_, __, ___) =>
                                        comingsoonpage(),
                                    // 指定 transitionsBuilder
                                    transitionsBuilder:
                                        (_, animation, __, child) {
                                      return SlideTransition(
                                          position: Tween<Offset>(
                                                  begin: Offset(-1.0, 0.0),
                                                  end: Offset(0.0, 0.0))
                                              .animate(animation),
                                          child: child);
                                    }));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        "通知",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: checkimage(),
                  ),
                ))
              ],
            ),
          ],
        )),
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
            if (value == 3) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const downloadpage()));
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

List<Movienotification> _listSeries = [
  Movienotification(
      textData1: "最新到片",
      textData2: "非常校護檔案",
      imageURL: "assets/videolist/videolist1.jpg"),
  Movienotification(
      textData1: "最新到片",
      textData2: "以家人之名",
      imageURL: "assets/videolist/videolist2.jpg"),
  Movienotification(
      textData1: "最新到片",
      textData2: "龍族教義",
      imageURL: "assets/videolist/videolist3.jpg"),
  Movienotification(
      textData1: "最新到片",
      textData2: "詐騙之王",
      imageURL: 'assets/videolist/videolist4.jpg'),
  Movienotification(
      textData1: "本日10大熱門排行：台灣",
      textData2: "觀賞所有影片",
      imageURL: "assets/videolist/videolist5.jpg"),
  Movienotification(
      textData1: "繼續觀賞",
      textData2: "雖然是精神病但沒關係",
      imageURL: "assets/videolist/videolist6.jpg"),
  Movienotification(
      textData1: "重看你最喜歡的片段",
      textData2: "瀏覽你看過的作品",
      imageURL: "assets/videolist/videolist7.jpg"),
];

List<SizedBox> checkimage() {
  List<SizedBox> res = [];
  for (var singlemovie in _listSeries) {
    res.add(SizedBox(
      width: 420,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            width: 120,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(singlemovie.imageURL!),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
              width: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        singlemovie.textData1!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        singlemovie.textData2!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "4月24號",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),

      // Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: Row(
      //     children: [
      //       Column(children: [
      //         Text(
      //           singlemovie.textData1!,
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //         Text(
      //           singlemovie.textData2!,
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //         Text(
      //           "4月24號",
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //       ]),

      //   ),
      // )
    ));
  }
  return res;
}

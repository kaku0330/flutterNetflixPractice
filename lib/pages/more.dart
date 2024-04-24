import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/models/players.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/pages/commingsoon.dart';
import 'package:testflutter/pages/download.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/search.dart';

class morepage extends StatefulWidget {
  const morepage({super.key});

  @override
  State<morepage> createState() => _morepage();
}

class _morepage extends State<morepage> {
  int currentIndex = 0;
  double defaultSize = 60.0;
  double selectedSize = 80.0;
  int _selectedPlayerIndex = -1;
  String defaulttext = "https://www.netflix.com/browser";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                Row(children: playersrow()),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Ink(
                    child:
                        const Row(children: [Icon(Icons.edit), Text("管理使用者")]),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 29, 29, 29),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "將Netflix介紹給朋友",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "將此連結分享給朋友,讓他們也可以一起討論您最喜愛的",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "節目與電影。",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "條款與條件",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 14, 14, 14)),
                      )
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        defaulttext,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: defaulttext));
                            Fluttertoast.showToast(
                                msg: "複製成功",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          },
                          child: const Text(
                            "複製連結",
                            style: TextStyle(color: Colors.black),
                          ))
                    ]),
                Container(
                  height: 120,
                  width: 445,
                  color: const Color.fromARGB(255, 29, 29, 29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                          width: 80,
                          height: 80,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/icons/facebook.png',
                                width: 60,
                                height: 60,
                              ),
                              const Text(
                                "Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 5,
                        height: 60,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                          width: 80,
                          height: 80,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/icons/Gmail-icon.png',
                                width: 60,
                                height: 60,
                              ),
                              const Text(
                                "Gmail",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 5,
                        height: 60,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                          width: 80,
                          height: 80,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/icons/line.png',
                                width: 60,
                                height: 60,
                              ),
                              const Text(
                                "Line",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 5,
                        height: 60,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                          width: 80,
                          height: 80,
                          child: Column(
                            children: [
                              Icon(
                                Icons.more_horiz,
                                size: 57,
                              ),
                              Text(
                                "更多",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
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
            if (value == 3) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const downloadpage()));
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

  List<Players> player = [
    Players(player: "player1"),
    Players(player: "player2"),
    Players(player: "player3"),
    Players(player: "player4"),
    Players(player: "player5"),
  ];

  List<Column> playersrow() {
    List<Column> res = [];
    for (int index = 0; index < player.length; index++) {
      Players playerData = player[index];
      double currentSize =
          index == _selectedPlayerIndex ? selectedSize : defaultSize;

      res.add(Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPlayerIndex = index;
                      });
                    },
                    child: SizedBox(
                      width: currentSize,
                      height: currentSize,
                      child: Image.asset("assets/icons/icon_user.jpg"),
                    ),
                  ),
                  Text(playerData.player!,
                      style: const TextStyle(color: Colors.grey))
                ],
              ))
        ],
      ));
    }

    return res;
  }
}

// width: 60,
//               height: 60,
//               child: Image.asset("assets/icons/icon_user.jpg")),
//           Text(
//             playerdata.player!,
//             style: TextStyle(color: Colors.grey),
//           )

import 'package:flutter/material.dart';
import 'package:testflutter/pages/download.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/more.dart';
import 'package:testflutter/pages/notificationpage.dart';
import 'package:testflutter/pages/search.dart';
import 'package:video_player/video_player.dart';

class comingsoonpage extends StatefulWidget {
  const comingsoonpage({super.key});

  @override
  State<comingsoonpage> createState() => _comingsoonpage();
}

class _comingsoonpage extends State<comingsoonpage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/gui_zhuang_yuan.mp4")
      ..initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  late Icon checkplay;
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "通知",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
                const SizedBox(
                  width: 270,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 100),
                              // 指定 pageBuilder
                              pageBuilder: (_, __, ___) =>
                                  const notificationpage(),
                              // 指定 transitionsBuilder
                              transitionsBuilder: (_, animation, __, child) {
                                return SlideTransition(
                                    position: Tween<Offset>(
                                            begin: const Offset(1.0, 0.0),
                                            end: const Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child);
                              }));
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 35,
                    )),
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Center(
                    child: _controller.value.isPlaying
                        ? AspectRatio(
                            aspectRatio: 16 / 9,
                            child: VideoPlayer(_controller),
                          )
                        : AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              child: Image.asset(
                                "assets/guizhuanyuan2.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                    width: 500,
                    height: 250,
                    child: Icon(
                      _controller.value.isPlaying
                          ? null
                          : Icons.play_circle_outline,
                      size: 60,
                      color: Colors.white,
                    ))
              ],
            ),
            Row(
              children: [
                Image.asset(
                  "assets/guiruqing.png",
                  fit: BoxFit.fill,
                  width: 250,
                  height: 100,
                ),
                const SizedBox(
                  width: 90,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "提醒我",
                      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "分享",
                      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "10月9號上線",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.5), fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("鬼莊園",
                      style: TextStyle(color: Colors.white, fontSize: 35)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "劇情描述一家七口買下古老的豪宅希爾山莊，打算待上一陣子後即將房屋整頓拋售，藉此大賺一筆，沒想到入住成了惡夢的開始，每個人的未來皆受此影響，影集穿插不少倒敘畫面，以過去和現在的片段交互敘事，有別於一般恐怖電影，不僅營造氛圍技術一流，更著重於角色塑造。影集推出後獲得諸多好評，爛番茄新鮮度目前為 93 %。",
                      maxLines: 3,
                      style: TextStyle(color: Colors.grey.withOpacity(0.5))),
                  SizedBox(
                    height: 5,
                  ),
                  Text("不祥●嚇人●黑暗●感動人心●恐怖片●懸疑推理片●驚悚片",
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
            )
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

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/pages/commingsoon.dart';
import 'package:testflutter/pages/download.dart';
import 'package:testflutter/pages/item1.dart';
import 'package:testflutter/pages/item2.dart';
import 'package:testflutter/pages/login.dart';
import 'package:testflutter/pages/more.dart';
import 'package:testflutter/pages/search.dart';

enum SearchListType { ALL, SERIES, VIDEO }

class indexpage extends StatefulWidget {
  const indexpage({super.key});

  @override
  State<indexpage> createState() => _indexpage();
}

class _indexpage extends State<indexpage> {
  final List<Widget> pages = [
    const Center(child: Text('首页')),
    const Center(child: Text('搜索')),
    const Center(child: Text('即将上线')),
    const Center(child: Text('下载内容')),
    const Center(child: Text('更多')),
  ];
  int currentIndex = 0;
  SearchListType _type = SearchListType.ALL;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> myKey = GlobalKey();

    List<String> _list2 = [
      "所有類型",
      "可供下載",
      "台灣",
      "犯罪",
      "亞洲",
      "兒童",
      "青少年",
      "科幻/奇幻",
      "科學及自然",
      "紀錄片系列",
      "美國",
      "英國",
      "食物及旅遊",
      "恐怖"
    ];
    String selected = "所有類型";
    return Scaffold(
        key: myKey,
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              backgroundColor: Colors.transparent,
              title: _type == SearchListType.ALL
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _type = SearchListType.SERIES;
                              setState(() {});
                            },
                            child: const Text(
                              "節目",
                              style: TextStyle(color: Colors.white),
                            )),
                        InkWell(
                            onTap: () {
                              _type = SearchListType.SERIES;
                              setState(() {});
                            },
                            child: const Text(
                              "電影",
                              style: TextStyle(color: Colors.white),
                            )),
                        InkWell(
                            onTap: () {
                              _type = SearchListType.SERIES;
                              setState(() {});
                            },
                            child: const Text(
                              "我的片單",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const Row(
                            children: [
                              Text(
                                "節目",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    backgroundColor:
                                        Colors.black.withOpacity(0.7),
                                    body: Stack(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 64.0),
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: List.generate(
                                                  _list2.length, (index) {
                                                return Center(
                                                    child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        selected =
                                                            _list2[index];
                                                      });

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      _list2[index],
                                                      style: TextStyle(
                                                          fontSize: selected ==
                                                                  _list2[index]
                                                              ? 24.0
                                                              : 20,
                                                          color: selected ==
                                                                  _list2[index]
                                                              ? Colors.white
                                                              : Colors.white
                                                                  .withOpacity(
                                                                      0.6)),
                                                    ),
                                                  ),
                                                ));
                                              }),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Icon(
                                                Icons.cancel,
                                                size: 64,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Text(
                                selected,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/netflix_n.png"),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                width: double.infinity,
                child: Image(image: AssetImage("assets/videophoto2.jpg")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "我的片單",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: TextButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 28,
                          ),
                          Text(
                            "播放",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Column(
                      children: [
                        Icon(
                          Icons.fmd_bad,
                          color: Colors.white,
                        ),
                        Text(
                          "資訊",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24.0),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "動畫",
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                      height: 150, //限制高度不然報錯
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: picList(),
                      ))
                ],
              )
            ]))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (value) {
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

  List<Widget> picList() {
    List<String> imagePaths = [
      'assets/a.jpg',
      'assets/b.jpg',
      'assets/c.jpg',
      'assets/d.jpg',
      'assets/e.jpg',
      'assets/f.jpg',
      'assets/g.jpg',
      'assets/h.jpg'
    ];
    List<String> imagename = [
      '這是一隻柴柴',
      '進擊的巨人',
      '鬼滅之刃:無限列車',
      '咒術迴戰',
      '我忘了這動畫叫甚麼',
      '86－不存在的戰區－',
      '來自深淵',
      '文豪野犬'
    ];
    return List.generate(8, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: AssetImage(imagePaths[index]), fit: BoxFit.cover)),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onLongPress: () {
              Fluttertoast.showToast(
                  msg: imagename[index],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.black,
                  fontSize: 16);
            },
          ),
        ),
      );
    });
  }

  void openLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const Loginpage();
    }));
  }

  void openitem1Page(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const item1page();
    }));
  }

  void openitem2Page(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const item2page();
    }));
  }
}

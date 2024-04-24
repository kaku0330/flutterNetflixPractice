import 'package:flutter/material.dart';
import 'package:testflutter/models/moviesearch.dart';
import 'package:testflutter/pages/commingsoon.dart';
import 'package:testflutter/pages/download.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/more.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpage();
}

class _searchpage extends State<searchpage> {
  final List<Widget> pages = [
    const Center(child: Text('首页')),
    const Center(child: Text('搜索')),
    const Center(child: Text('即将上线')),
    const Center(child: Text('下载内容')),
    const Center(child: Text('更多')),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              width: 500,
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: '搜尋節目、電影、類型等',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic)),
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

  List<SizedBox> checkimage() {
    List<SizedBox> res = [];
    for (var singlemovie in _listSeries) {
      res.add(SizedBox(
        width: 550,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              singlemovie.imageURL!,
              width: 200,
              height: 100,
            ),
            Text(
              singlemovie.title!,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(
              Icons.play_arrow,
              color: Colors.white,
            )
          ],
        ),
      ));
    }
    return res;
  }
}

List<Moviesearch> _listSeries = [
  Moviesearch(
      title: "拉契特：黯衣天使",
      imageURL:
          "https://obs.line-scdn.net/0hTaFTyJ2mC057LSILS990GUF7CCFIQRhNHxtaTThDVXoBHk8aEhtAIFh4BS4ETUwQEktAKF8pEH8EGRgfQkNA/w644"),
  Moviesearch(
      title: "陽光普照",
      imageURL:
          "https://doqvf81n9htmm.cloudfront.net/data/changchi_177/7-16/730/1005/%EF%BC%91%EF%BC%92/87/facebook-Linked_Image___72954903_3186658091349282_6845006129731207168_n.jpg"),
  Moviesearch(
      title: "誰先愛上他的",
      imageURL:
          "https://miro.medium.com/max/1200/1*r-DPHU8cySquWm3exXOIOQ.jpeg"),
  Moviesearch(
      title: "智能社會：進退兩難",
      imageURL:
          'https://kevinmoleaf.weebly.com/uploads/2/6/2/4/26248190/the-socdilemmadilemmaial-dilemma-1200_orig.jpg'),
  Moviesearch(
      title: "拉契特：黯衣天使",
      imageURL:
          "https://obs.line-scdn.net/0hTaFTyJ2mC057LSILS990GUF7CCFIQRhNHxtaTThDVXoBHk8aEhtAIFh4BS4ETUwQEktAKF8pEH8EGRgfQkNA/w644"),
  Moviesearch(
      title: "陽光普照",
      imageURL:
          "https://doqvf81n9htmm.cloudfront.net/data/changchi_177/7-16/730/1005/%EF%BC%91%EF%BC%92/87/facebook-Linked_Image___72954903_3186658091349282_6845006129731207168_n.jpg"),
  Moviesearch(
      title: "誰先愛上他的",
      imageURL:
          "https://miro.medium.com/max/1200/1*r-DPHU8cySquWm3exXOIOQ.jpeg"),
  Moviesearch(
      title: "智能社會：進退兩難",
      imageURL:
          'https://kevinmoleaf.weebly.com/uploads/2/6/2/4/26248190/the-socdilemmadilemmaial-dilemma-1200_orig.jpg'),
  Moviesearch(
      title: "拉契特：黯衣天使",
      imageURL:
          "https://obs.line-scdn.net/0hTaFTyJ2mC057LSILS990GUF7CCFIQRhNHxtaTThDVXoBHk8aEhtAIFh4BS4ETUwQEktAKF8pEH8EGRgfQkNA/w644"),
  Moviesearch(
      title: "陽光普照",
      imageURL:
          "https://doqvf81n9htmm.cloudfront.net/data/changchi_177/7-16/730/1005/%EF%BC%91%EF%BC%92/87/facebook-Linked_Image___72954903_3186658091349282_6845006129731207168_n.jpg"),
  Moviesearch(
      title: "誰先愛上他的",
      imageURL:
          "https://miro.medium.com/max/1200/1*r-DPHU8cySquWm3exXOIOQ.jpeg"),
  Moviesearch(
      title: "智能社會：進退兩難",
      imageURL:
          'https://kevinmoleaf.weebly.com/uploads/2/6/2/4/26248190/the-socdilemmadilemmaial-dilemma-1200_orig.jpg')
];

void checkimage() {}

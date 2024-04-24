import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/api/header.dart';
import 'package:testflutter/main.dart';
import '../../api/api.dart';

class item1page extends StatefulWidget {
  const item1page({super.key});

  @override
  State<item1page> createState() => _item1page();
}

class _item1page extends State<item1page> {
  final Set<String> _selected1 = {};
  final Set<String> _selected2 = {};
  final Set<String> _selected3 = {};
  final Set<String> _selected4 = {};
  String dropvalue = "johnny";
  updateselected(Set<String> newSelection, int num) {
    setState(() {
      switch (num) {
        case 1:
          Iterator<String> iterator = newSelection.iterator;
          var lastdata = "";
          while (iterator.moveNext()) {
            lastdata = iterator.current;
          }

          _selected1.clear();
          _selected1.add(lastdata);
          break;
        case 2:
          Iterator<String> iterator = newSelection.iterator;
          var lastdata = "";
          while (iterator.moveNext()) {
            lastdata = iterator.current;
          }

          _selected2.clear();
          _selected2.add(lastdata);
          break;
        case 3:
          Iterator<String> iterator = newSelection.iterator;
          var lastdata = "";
          while (iterator.moveNext()) {
            lastdata = iterator.current;
          }

          _selected3.clear();
          _selected3.add(lastdata);
          break;
        case 4:
          Iterator<String> iterator = newSelection.iterator;
          var lastdata = "";
          while (iterator.moveNext()) {
            lastdata = iterator.current;
          }

          _selected4.clear();
          _selected4.add(lastdata);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text("滿意度調查", style: TextStyle(fontSize: 30, height: 2)),
          const Text("食物", style: TextStyle(fontSize: 25, height: 2)),
          SegmentedButton(
            emptySelectionAllowed: true,
            multiSelectionEnabled: true,
            segments: const <ButtonSegment<String>>[
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
                  value: "great",
                  label: Text("great")),
              ButtonSegment<String>(
                  icon: Icon(Icons.favorite),
                  value: "good",
                  label: Text("good")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.mood_bad_outlined,
                  ),
                  value: "bad",
                  label: Text("bad")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_down_alt_outlined,
                  ),
                  value: "suck",
                  label: Text("suck")),
            ],
            selected: _selected1,
            onSelectionChanged: (Set<String> value) {
              updateselected(value, 1);
            },
          ),

          const Text("人員", style: TextStyle(fontSize: 25, height: 2)),
          SegmentedButton(
            emptySelectionAllowed: true,
            multiSelectionEnabled: true,
            segments: const <ButtonSegment<String>>[
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
                  value: "great",
                  label: Text("great")),
              ButtonSegment<String>(
                  icon: Icon(Icons.favorite),
                  value: "good",
                  label: Text("good")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.mood_bad_outlined,
                  ),
                  value: "bad",
                  label: Text("bad")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_down_alt_outlined,
                  ),
                  value: "suck",
                  label: Text("suck")),
            ],
            selected: _selected2,
            onSelectionChanged: (Set<String> value) {
              updateselected(value, 2);
            },
          ),
          const Text("環境", style: TextStyle(fontSize: 25, height: 2)),
          SegmentedButton(
            emptySelectionAllowed: true,
            multiSelectionEnabled: true,
            segments: const <ButtonSegment<String>>[
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
                  value: "great",
                  label: Text("great")),
              ButtonSegment<String>(
                  icon: Icon(Icons.favorite),
                  value: "good",
                  label: Text("good")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.mood_bad_outlined,
                  ),
                  value: "bad",
                  label: Text("bad")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_down_alt_outlined,
                  ),
                  value: "suck",
                  label: Text("suck")),
            ],
            selected: _selected3,
            onSelectionChanged: (Set<String> value) {
              updateselected(value, 3);
            },
          ),
          const Text("價格", style: TextStyle(fontSize: 25, height: 2)),
          SegmentedButton(
            emptySelectionAllowed: true,
            multiSelectionEnabled: true,
            segments: const <ButtonSegment<String>>[
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
                  value: "great",
                  label: Text("great")),
              ButtonSegment<String>(
                  icon: Icon(Icons.favorite),
                  value: "good",
                  label: Text("good")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.mood_bad_outlined,
                  ),
                  value: "bad",
                  label: Text("bad")),
              ButtonSegment<String>(
                  icon: Icon(
                    Icons.thumb_down_alt_outlined,
                  ),
                  value: "suck",
                  label: Text("suck")),
            ],
            selected: _selected4,
            onSelectionChanged: (Set<String> value) {
              updateselected(value, 4);
            },
          ),
          // const Center(
          //     child: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       "姓名",
          //       style: TextStyle(fontSize: 40, height: 2),
          //     )
          //   ],
          // )),
          // Center(
          //   child: DropdownButton<String>(
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         dropvalue = newValue!;
          //       });
          //     },
          //     items: const [
          //       DropdownMenuItem(
          //         value: "amy",
          //         child: Text("amy"),
          //       ),
          //       DropdownMenuItem(
          //         value: "johnny",
          //         child: Text("johnny"),
          //       ),
          //       DropdownMenuItem(
          //         value: "jerry",
          //         child: Text("jerry"),
          //       )
          //     ],
          //     value: dropvalue,
          //   ),
          // ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const MyHomePage();
                        }));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          backgroundColor: Colors.blue),
                      child: const Text(
                        "返回",
                        style: TextStyle(fontSize: 20),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        updateselected({}, 1);
                        updateselected({}, 2);
                        updateselected({}, 3);
                        updateselected({}, 4);
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          backgroundColor: Colors.blue),
                      child: const Text(
                        "重置",
                        style: TextStyle(fontSize: 20),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () async {
                        if (_selected1.isNotEmpty &&
                            _selected2.isNotEmpty &&
                            _selected3.isNotEmpty &&
                            _selected4.isNotEmpty) {
                          Map<String, dynamic> queryParams = {
                            'food': _selected1.elementAt(0),
                            'employee': _selected2.elementAt(0),
                            'environment': _selected3.elementAt(0),
                            'price': _selected4.elementAt(0),
                          };
                          await CallApi(url: '/servey').post(
                              queryParams, PlantHeaders().setPlantIDHeader(""));
                          Fluttertoast.showToast(
                              msg: "送出成功",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                              fontSize: 16.0);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const MyHomePage();
                          }));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("請確認是否所有選項已勾選"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text("返回"))
                                  ],
                                );
                              });
                        }
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          backgroundColor: Colors.blue),
                      child: const Text(
                        "送出",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              )),
        ])));
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testflutter/api/api.dart';
import 'package:testflutter/api/header.dart';
import 'package:testflutter/main.dart';
import 'package:testflutter/models/serveyget.dart';

class item2page extends StatefulWidget {
  const item2page({super.key});

  @override
  State<item2page> createState() => _item2page();
}

class _item2page extends State<item2page> {
  // Future<List<TableRow>> row = Future.value([]);
  var originvalue = "0";
  late List<DropdownMenuItem<Object>> menuItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FutureBuilder(
                future: generatetablerows(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {}
                  if (snapshot.hasData) {
                    return Column(children: [
                      // const SizedBox(
                      //   height: 50,
                      // ),
                      LayoutBuilder(builder: (context, constraints) {
                        bool isLandspace =
                            constraints.maxWidth < constraints.maxHeight;

                        if (isLandspace) {
                          return Row(children: [
                            const SizedBox(
                              height: 200,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const MyHomePage();
                                  }));
                                },
                                child: const Text(
                                  "返回",
                                  style: TextStyle(fontSize: 30),
                                ))
                          ]);
                        } else {
                          return TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const MyHomePage();
                                }));
                              },
                              child: const Text(
                                "返回",
                                style: TextStyle(fontSize: 30),
                              ));
                        }
                      }),
                      SingleChildScrollView(
                        child: SizedBox(
                            height: 800,
                            width: 400,
                            child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  Table(
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FixedColumnWidth(75.0),
                                        1: FixedColumnWidth(75.0),
                                        2: FixedColumnWidth(75.0),
                                        3: FixedColumnWidth(75.0),
                                      },
                                      border: TableBorder.all(
                                          color: Colors.black87,
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      children: snapshot.requireData),
                                ])),
                      )
                    ]);
                  } else {
                    return Column(children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const MyHomePage();
                          }));
                        },
                        child: const Text("返回2"),
                      ),
                    ]);
                  }
                },
              ),
            ])
          ],
        ),
      ),
    );
  }

  Future<List<TableRow>> generatetablerows() async {
    List<TableRow> rows = [];

    Map<String, dynamic> queryParams = {};
    Response value = await CallApi(url: '/servey')
        .get(queryParams, PlantHeaders().setPlantIDHeader(""));

    ServeyGet serveyget = ServeyGet.fromJson(value.data);

    rows.add(const TableRow(children: <Widget>[
      Text(
        "食物",
        style: TextStyle(fontSize: 28),
      ),
      Text(
        "人員",
        style: TextStyle(fontSize: 28),
      ),
      Text(
        "環境",
        style: TextStyle(fontSize: 28),
      ),
      Text(
        "價錢",
        style: TextStyle(fontSize: 28),
      ),
    ]));
    // print(serveyget.servey.length);
    for (var i = 0; i < serveyget.servey.length; i++) {
      // print(serveyget.servey[i]);
      // var value = jsonDecode(serveyget.servey[i]);
      rows.add(TableRow(children: <Widget>[
        Text(
          serveyget.servey[i]["food"],
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          serveyget.servey[i]["employee"],
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          serveyget.servey[i]["environment"],
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          serveyget.servey[i]["price"],
          style: const TextStyle(fontSize: 22),
        ),
      ]));
    }
    // for (var item in serveyget.servey!) {
    //   print(item);
    // }
    return rows;
  }
}

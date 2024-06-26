import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/models/useradd.dart';

import '../api/api.dart';
import '../api/header.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPage();
}

class _signupPage extends State<signupPage> {
  final accountcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              const SizedBox(
                width: 105,
              ),
              Image.asset(
                "assets/netflix_logo.png",
                width: 160,
                height: 80,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                width: 70,
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
                  child:
                      const Text("Help", style: TextStyle(color: Colors.white)))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: accountcontroller,
            style: const TextStyle(),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              hintText: " 電子郵件或電話號碼",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordcontroller,
            style: const TextStyle(),
            obscureText: true,
            decoration: const InputDecoration(
                filled: true, fillColor: Colors.grey, hintText: " 密碼"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 400,
            child: ElevatedButton(
              onPressed: () {
                loginCheck(
                    context, accountcontroller.text, passwordcontroller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "註冊",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      )),
    );
  }
}

void loginCheck(BuildContext context, String account, String password) async {
  Map<String, dynamic> queryParams = {
    'username': account,
    'password': password,
  };
  Response value = await CallApi(url: '/signup')
      .post(queryParams, PlantHeaders().setPlantIDHeader(""));

  if (value.status == 200) {
    Useradd data = Useradd.fromJson(value.data);
    if (data.username == account) {
      Fluttertoast.showToast(
          msg: "註冊成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      Navigator.of(context).pop(true);
    }
  }
}

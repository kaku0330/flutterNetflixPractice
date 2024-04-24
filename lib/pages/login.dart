// import 'dart:js';
// import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/global.dart';
import 'package:testflutter/models/usercount.dart';
import 'package:testflutter/api/header.dart';
import 'package:testflutter/models/userupdate.dart';

import '../../api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/main.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  final accountcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    accountcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: const Color.fromARGB(255, 32, 229, 236),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey.withOpacity(0.6),
          middle: const Text("Login"),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                    controller: accountcontroller,
                    cursorRadius: const Radius.circular(10),
                    placeholder: 'アカウント',
                    prefix: const Icon(Icons.person)),
                CupertinoTextField(
                  cursorRadius: const Radius.circular(10),
                  cursorHeight: 2.0,
                  prefix: const Icon(Icons.lock_outline),
                  controller: passwordcontroller,
                  obscureText: true,
                  placeholder: 'パスワード',
                ),
                ElevatedButton(
                  onPressed: () {
                    loginCheck(context, accountcontroller.text,
                        passwordcontroller.text);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 206, 108, 16))),
                  child: const Text("ログイン"),
                ),
                ElevatedButton(
                  onPressed: () {
                    changepwd(context, accountcontroller.text,
                        passwordcontroller.text);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 206, 108, 16))),
                  child: const Text("パスワードを設置"),
                )
              ],
            ),
          ),
        ));
  }
}

void loginCheck(BuildContext context, String account, String password) async {
  Map<String, dynamic> queryParams = {
    'username': account,
    'password': password,
  };
  Response value = await CallApi(url: '/finduser')
      .get(queryParams, PlantHeaders().setPlantIDHeader(""));

  if (value.status == 200) {
    Usercount data = Usercount.fromJson(value.data);
    if (data.row) {
      AppShareData.localStorage.setString("username", account);
      AppShareData.localStorage.setString("mail", "kaku880330@gmail.com");
      AppShareData.localStorage.setString("pic", "assets/a.jpg");
      Fluttertoast.showToast(
          msg: "登入成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("帳號密碼錯誤"),
              content: const Text("請重新輸入"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("確認"))
              ],
            );
          });
    }
  }
}

void changepwd(BuildContext context, String account, String password) async {
  Map<String, dynamic> queryParams = {
    'username': account,
    'password': password,
  };
  Response value = await CallApi(url: '/userupdate')
      .post(queryParams, PlantHeaders().setPlantIDHeader(""));

  if (value.status == 200) {
    Userupdate data = Userupdate.fromJson(value.data);
    if (data.username != "") {
      Fluttertoast.showToast(
          msg: "パスワードを設置しました",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      // Navigator.push(
      // context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Fluttertoast.showToast(
          msg: "查無此帳號",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}

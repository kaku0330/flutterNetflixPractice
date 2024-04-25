import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/api/api.dart';
import 'package:testflutter/api/header.dart';
import 'package:testflutter/global.dart';
import 'package:testflutter/models/usercount.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/signup.dart';

class loginplayerpage extends StatefulWidget {
  const loginplayerpage({super.key});

  @override
  State<loginplayerpage> createState() => _loginplayerpage();
}

class _loginplayerpage extends State<loginplayerpage> {
  final accountcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  var checkswitch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: 440,
            child: Image.asset(
              "assets/netflix_logo.png",
              width: 160,
              height: 80,
              alignment: Alignment.centerLeft,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 380,
            child: Text(
              "登入",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
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
            height: 10,
          ),
          TextField(
            controller: passwordcontroller,
            style: const TextStyle(),
            obscureText: true,
            decoration: const InputDecoration(
                filled: true, fillColor: Colors.grey, hintText: " 密碼"),
          ),
          const SizedBox(
            height: 10,
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
                "登入",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: checkswitch,
                  onChanged: (Value) {
                    setState(() {
                      if (checkswitch) {
                        checkswitch = false;
                      } else {
                        checkswitch = true;
                      }
                    });
                  }),
              const Text(
                "記得我",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 260,
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
                    const Text("需要幫忙?", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/facebook.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                " 使用Facebook 登錄",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text("New to Netflix?",
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signupPage()));
                  },
                  child: const Text("立即註冊",
                      style: TextStyle(color: Colors.white, fontSize: 20)))
            ],
          )
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
          context, MaterialPageRoute(builder: (context) => const indexpage()));
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

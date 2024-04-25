import 'package:flutter/material.dart';
import 'package:testflutter/pages/index.dart';
import 'package:testflutter/pages/loginplayer.dart';
// import 'package:flutter/widgets.dart';
import 'global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppShareData.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 7, 52, 151)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool startAnimation = false;

  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: startAnimation ? 0.0 : 1.0,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            width: startAnimation ? 150.0 : 250.0,
            child: Image.asset("assets/netflix_logo.png"),
            onEnd: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const loginplayerpage()));
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MyWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashActivity(),
    );
  }
}

class SplashActivity extends StatefulWidget {
  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  static const int SPLASH_TIME_OUT = 3000;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: SPLASH_TIME_OUT), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyWidget()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/backgound.png'),

            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/image/logomain.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Activity'),
      ),
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}

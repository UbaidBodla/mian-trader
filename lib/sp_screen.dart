import 'package:flutter/material.dart';

import 'splash.dart';

class Sp_screen extends StatefulWidget {
  static String id = 'Sp_screen';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Sp_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}

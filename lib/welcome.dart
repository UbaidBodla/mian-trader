import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fmiantrader/Registration_secreen.dart';
import 'package:fmiantrader/login_screen.dart';
import 'splash.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'componenets.dart';

class Welcome extends StatefulWidget {
  static String id='Welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  @override
  void initState() {

    super.initState();
      controller=AnimationController(
        duration: Duration(seconds: 3),
        vsync: this);


      controller.forward();
      animation=ColorTween(begin: Colors.redAccent,end: Colors.amberAccent).animate(controller) ;
      controller.addListener((){
        setState(() {});});


  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Hero(
                    tag: 'log',
                    child: Container(
                      child: Center(
                          child: Image.asset(
                            'images/log.jpeg',
                            width: controller.value*220,height: controller.value*200,)),

                    ),
                  ),
                  SizedBox(width: 10.0,height: 20.0,),
                  TypewriterAnimatedTextKit(
                    text:['Mian Traders'],
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 45
                    ),


                  )
                ],
              ),
              SizedBox(
                height: 90.0,
              ),
              Rounded_Button(

                title: 'Log In',color: Colors.lightBlueAccent ,

                onPressed: (){
                Navigator.pushNamed(context, Login.id);
              },),
              Rounded_Button(title: 'Register',color: Colors.blueAccent ,onPressed: (){
                Navigator.pushNamed(context, Registration.id);
              },),

            ],
          ),
        ),




      ),
    );
  }
}


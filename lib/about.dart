import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static String id='About';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        actions: <Widget>[
          Icon(Icons.arrow_back,color: Colors.redAccent,),

        ],
        title: Text('Mian Traders'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Version',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('1.0.0',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                ],
              ),

            ),
            Divider(
              color: Colors.amber,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Developed By ',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Blue cascade',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                ],
              ),

            ),
            Divider(
              color: Colors.amber,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Software Engineer                   Email:',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Ubaid Ur Rehman                    ubaidbodla.000@gmail.com',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                ],
              ),

            ),
            Divider(
              color: Colors.amber,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Cell',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('03017282188',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                ],
              ),

            ),
            Divider(
              color: Colors.amber,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Email',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('umairbodla2188@gmail.com',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                ],
              ),

            ),
            Divider(
              color: Colors.amber,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('City',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Multan',style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                ],
              ),

            ),
            Divider(
              color: Colors.amber,
            ),


            Container(
              width:double.infinity,

            )
          ],
        ),
      ),







    );
  }
}
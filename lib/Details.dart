import 'package:flutter/material.dart';

class Details extends StatelessWidget {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/log.jpeg')
              ],
            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text('Shop Name:'),

                Text('             MIAN TRADERS.',
                style: TextStyle(
                  fontWeight: FontWeight.w900
                ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text('Owner Name:'),

                Text('          Muhammad Umair Bodla.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text('Phone Number:'),

                Text('      0301 7282188',
                  style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Image.asset('images/wats.jpg',width: 35,height: 20,),

                Text('                        0345 7282188',
                  style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text(' Bank:'),

                Text('                       Faysal Bank Limited.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text('ACC Title:'),

                Text('                Muhammad Umair Bodla.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text('ACC Number:'),

                Text('      3193301000000063 .',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),)
              ],

            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Text(' Email ID:'),

                Text('             umairbodla2188@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),)
              ],

            ),


          ],
        ),
      ),

    );
  }
}
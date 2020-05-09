import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class catitems extends StatelessWidget {
  catitems(this.getvalue);
  final String getvalue;
  final _firestore =Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        actions: <Widget>[
          Icon(Icons.arrow_back,color: Colors.redAccent,),

        ],
        title: Text('Mian Traders'),
        backgroundColor: Colors.amber,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('$getvalue').orderBy('A').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final categories=snapshot.data.documents;
          List<catItems> categoriesWidget=[];
          for(var categori in categories){
            final catA=categori.data['A'];
            final catB=categori.data['A'];
            final catC=categori.data['A'];

            final categoriesWi= catItems(catname: catA,medname:catB,price: catC);
            categoriesWidget.add(categoriesWi);

          }
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
            child: ListView(
              children: categoriesWidget,
            ),
          );


        },
      ),
    );
  }
}





class catItems extends StatelessWidget {
  catItems({this.catname,this.medname,this.price});
  final String catname;
  final String medname;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(

        elevation: 5.0,

        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('category: $catname\n Model: $medname\n Price:  RS.$price ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 15.0,
            ),),
            Divider(
              color: Colors.yellowAccent,
            )
          ],

        ),
      ),
    );
  }
}



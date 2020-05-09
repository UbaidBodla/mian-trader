import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fmiantrader/catitems.dart';


class Items extends StatefulWidget {
  static String id='Items';
  @override
  _ItemsState createState() => _ItemsState();
}


class _ItemsState extends State<Items> {

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
        stream: _firestore.collection('categories').orderBy('A').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(

              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
            final categories=snapshot.data.documents;
            List<CategoriesB> categoriesWidget=[];
            for(var categori in categories){
              final catA=categori.data['A'];

              final categoriesWi= CategoriesB(A: catA);
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


class CategoriesB extends StatelessWidget {
  CategoriesB({this.A});
  final String A;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Material(
        elevation: 5.0,

        color: Colors.cyan,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder:(context)=>catitems(A) )
            );

          },
          splashColor: Colors.purpleAccent,
          minWidth: 350.0,
          height: 50.0,
          child: Text(A, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),),
        ),
      ),
    );
  }
}

import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fmiantrader/My_account.dart';
import 'package:fmiantrader/SearchService.dart';
import 'package:fmiantrader/categories.dart';
import 'package:fmiantrader/items_only.dart';

import 'Details.dart';
import 'SearchService.dart';
import 'Settings.dart';
import 'about.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  static String id = 'MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchService _searchService = SearchService();
  List<Map> search = <Map>[];

  @override
  void initState() {
    getDocs();
    super.initState();
  }

  Future getDocs() async {
    search = (await _searchService.getSearch()).map((item) => item.data).toList();
    setState(() {});
  }

  // TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mian Traders'),
        backgroundColor: Colors.amber,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Ubaid'),
              accountEmail: Text('bodla@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.orange,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.green),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => My_account(),
                  ),
                );
              },
              child: ListTile(
                title: Text('My Account Details'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Items(),
                  ),
                );
              },
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.asset('images/log.jpeg'),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text(
                              'Mian Umair Bodla',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.phone),
                            Text(
                              '0301 7282188',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(
                              'images/wats.jpg',
                              width: 18,
                              height: 18,
                            ),
                            Divider(),
                            Text(
                              ' 0345 7282188',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.amberAccent,
                                child: Text(
                                  'Details',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Details(),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Items.id);
                          },
                          minWidth: 160.0,
                          height: 70.0,
                          child: Text(
                            'Categories',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ItemsOnly.id);
                          },
                          minWidth: 160.0,
                          height: 70.0,
                          child: Text(
                            'Items',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (search != null) {
                    showSearch(
                      context: context,
                      delegate: Search(search),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Enter Item",
                    textAlign: TextAlign.center,
                  ),
                  // child: TextFormField(
                  //   textAlign: TextAlign.center,
                  //   controller: _name,
                  //   enabled: false,
                  //   decoration: InputDecoration(
                  //     // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  //     // border: OutlineInputBorder(
                  //     //   borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  //     //   borderRadius: BorderRadius.circular(32.0),
                  //     // ),
                  //     // enabledBorder: OutlineInputBorder(
                  //     //     borderSide: BorderSide(color: Colors.blueAccent),
                  //     //     borderRadius: BorderRadius.circular(32.0)),
                  //     // focusedBorder: OutlineInputBorder(
                  //     //   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  //     //   borderRadius: BorderRadius.circular(32.0),
                  //     // ),
                  //     dia
                  //     hintText: 'Enter Item',
                  //     enabled: false,
                  //   ),
                  //   onTap: () {
                  //     print("HELLPOW WORDL");
                  //   },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  final List<Map> searchList;

  Search(this.searchList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final list = searchList
        .where((element) => jsonEncode(element).toLowerCase().contains(
              query.toLowerCase(),
            ))
        .toList();

    return ListView(
      children: list
          .map(
            (item) => ListTile(
              onTap: () {
                //Do Whatever You want to do on item tap.
              },
              title: Text(item["A"]),
              subtitle: Text(item["B"]),
              trailing: Text(item["C"]),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = searchList
        .where((element) => jsonEncode(element).toLowerCase().contains(
              query.toLowerCase(),
            ))
        .toList();

    return ListView(
      children: list
          .map(
            (item) => ListTile(
              onTap: () {
                //Do Whatever You want to do on item tap.
              },
              title: Text(item["A"]),
              subtitle: Text(item["B"]),
              trailing: Text(item["C"]),
            ),
          )
          .toList(),
    );
  }
}

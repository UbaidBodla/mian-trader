import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fmiantrader/My_account.dart';
import 'package:fmiantrader/SearchService.dart';
import 'package:fmiantrader/categories.dart';
import 'package:fmiantrader/items_only.dart';
import 'package:image_picker/image_picker.dart';

import 'Details.dart';
import 'SearchService.dart';
import 'Settings.dart';
import 'about.dart';

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
    search =
        (await _searchService.getSearch()).map((item) => item.data).toList();
    setState(() {});
  }

  TextEditingController _name = TextEditingController();
  File imageFile;
  Widget showProfileImage() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
              child: imageSelection(),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: GestureDetector(
              onTap: () {
                showImageChoiceDialogue(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 75, right: 105),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageSelection() {
    return Container(
      child: this.imageFile == null
          ? Center(
              child: Container(
                  margin:
                      EdgeInsets.only(left: 6, right: 6, bottom: 24, top: 16),
                  child: Text(
                    'Choose a profile picture',
                    textAlign: TextAlign.center,
                  )),
            )
          : ClipOval(
              child: Image.file(
                this.imageFile,
                fit: BoxFit.fill,
              ),
            ),
    );
  }

  Future<void> showImageChoiceDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose profile picture'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _openGallery(context);
                  },
                  child: Text('Gallery'),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    _openCamera(context);
                  },
                  child: Text('Camera'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _openGallery(BuildContext context) async {
    var hasPermissionDenied = false;
    await ImagePicker.pickImage(source: ImageSource.gallery).then((picture) {
      if (picture != null) {
        this.setState(() {
          imageFile = picture;
        });
        Navigator.pop(context);
      }
    });
  }

  _openCamera(BuildContext context) async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((picture) {
      if (picture != null) {
        this.setState(() {
          imageFile = picture;
        });
        Navigator.pop(context);
      }
    });
  }

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
            Divider(
              color: Colors.white,
            ),
            Container(
              height: 250,
              color: Colors.white54,
              child: Column(
                children: <Widget>[
                  showProfileImage(),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    'Ubaid Ur Rehman',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    '03048480248',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    'Multan',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.cyan,
              thickness: 2,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      hintText: 'Enter Item',
                    ),
                    validator: (value) {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class serachDeligat extends SearchDelegate<String> {
  static String id = 'serachDeligat';
  Firestore _firestore = Firestore.instance;
  String ref = 'items';
  Future<List<DocumentSnapshot>> getSearch() async =>
      await _firestore.collection(ref).getDocuments().then((snaps) {
        return snaps.documents;
      });
  List<Map> search = <Map>[];
  Future getDocs() async {
    search = await (await getSearch()).map((item) => item.data).toList();
    return search;
  }

  @override
  void initState() {
    getDocs();
  }

  List<Map> searchAi = <Map>[];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () async {
          searchAi = await getDocs();
          print(searchAi);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = query;
    if (query.isEmpty) {
//      return await getDocs();
    }
    return Container();
  }
}

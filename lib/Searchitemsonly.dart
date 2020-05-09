import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fmiantrader/SearchService.dart';
import 'SearchService.dart';

class Serchitemsbymod extends StatefulWidget {
  static String id = 'serchitemsbymod';
  @override
  _SerchitemsbymodState createState() => _SerchitemsbymodState();
}

class _SerchitemsbymodState extends State<Serchitemsbymod> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mian Traders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              textAlign: TextAlign.center,
              style:
              TextStyle(
                  color: Colors.black,
                  fontSize: 15.0
              ),
              decoration: InputDecoration(border: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.blueAccent,width: 1.0),
                borderRadius: BorderRadius.circular(32.0),
              ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(32.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent,width: 2.0),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                hintText: ('Enter the Name of item'),
                hintStyle: TextStyle(
                  fontSize: 15.0,
                ),
              )),
          suggestionsCallback: (pattern) {
            return search.where(
                  (doc) => jsonEncode(doc)
                  .toLowerCase()
                  .contains(pattern.toLowerCase()),
            );
          },
          itemBuilder: (context, suggestion) {
            return Card(
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 6.0,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(suggestion['A'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),),
                    Text(suggestion['B'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        )),
                    Text(suggestion['C'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),)
                  ],
                ),

              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            final map = jsonDecode(suggestion);
          },
        ),
      ),
    );
  }
}

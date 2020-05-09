import 'package:flutter/material.dart';
import 'SearchService.dart';
import 'componenets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Login extends StatefulWidget {
  static String id ='Login Screen';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SearchService _searchService = SearchService();
  List<Map> search = <Map>[];

  @override
  void initState() {
    getDocs();
    super.initState();
  }

  Future getDocs() async {
    search =
        (await _searchService.getuserSearch()).map((user) => user.data).toList();
    setState(() {});
  }
  TextEditingController  _name = TextEditingController();
  TextEditingController  _phone = TextEditingController();


  final _form =GlobalKey<FormState>();
  final _formforphone =GlobalKey<FormState>();
  final _firestore=Firestore.instance;






  String _validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return '*Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid - Put last 11 digits only';
    }
    return null;
  }


  Widget _textFieldForName(){
    return Form(

      key: _form,
      child: Column(
        children: <Widget>[
          TextFormField(
              controller: _name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                border: OutlineInputBorder(
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
                hintText: 'Enter Your Name',
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Name is Required';
                }
              }
          )
        ],
      ),
    );
  }
  Widget _textFieldForPhone(){
    return Form(

      key: _formforphone,
      child: TextFormField(
          controller: _phone,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            border: OutlineInputBorder(
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
            hintText: 'Enter Your Name',
          ),
          validator: _validateMobile,
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(tag: 'log', child: Container(
                  height: 200.0,
                  child: Image.asset('images/log.jpeg',height: 700,),
                )),
                SizedBox(
                  height: 48.00,
                ),
                _textFieldForName(),

                SizedBox(
                  height: 15.0,
                ),

                SizedBox(
                  height: 15.0,
                ),
                _textFieldForPhone(),

                Rounded_Button(title: 'Log In',color: Colors.blueAccent ,onPressed: (){
                  print('hello');
                  final isvalid= _form.currentState.validate();
                  if(!isvalid) {
                    return;}
                  _form.currentState.save();
                  final valid= _formforphone.currentState.validate();
                  if(!valid) {
                    return;}
                 _formforphone.currentState.save();
                    print('$search');

    },
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}


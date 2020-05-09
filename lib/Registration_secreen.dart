import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmiantrader/splash.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'componenets.dart';


class Registration extends StatefulWidget {
  static String id='Registration Screen';
  @override
  _RegistrationState createState() => _RegistrationState();
}
TextEditingController  _name = TextEditingController();
TextEditingController  _phone = TextEditingController();
TextEditingController  _city = TextEditingController();
final _form =GlobalKey<FormState>();
final _secondForm = GlobalKey<FormState>();
final _thirdForm = GlobalKey<FormState>();

String _validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return '*Required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid - Please Enter your valid Number';
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
Widget _textFieldFor(){
  return Form(

    key: _secondForm,
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
          hintText: 'Enter Your Phone',
        ),
        validator: _validateMobile,




    ),
  );
}
Widget _textField(){
  return Form(

    key: _thirdForm,
    child: TextFormField(
        controller: _city,
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
          hintText: 'Enter Your City',
        ),
        validator: (value){
          if(value.isEmpty){
            return 'City is Required';
          }
        }
    ),
  );
}


class _RegistrationState extends State<Registration> {

  bool Showspinner=false;
  final _firestore=Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: Showspinner,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(tag: 'log', child: Container(
                    height: 200.0,
                    child: Image.asset('images/log.jpeg',height: 400,width: 600,),
                  )),
                  SizedBox(
                    height: 30.00,
                  ),
                  _textFieldForName(),
                  SizedBox(
                    height: 10.00,
                  ),
                  SizedBox(
                    height: 30.00,

                    child: CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'PK',
                    favorite: ['+92','PK'],

                    // optional. Shows only country name and flag
                    showCountryOnly: true,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: true,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _textFieldFor(),
                  SizedBox(
                    height: 10.0,
                  ),

                  SizedBox(
                    height: 30.0,
                  ),
                  _textField(),



                  SizedBox(
                    height: 20.0,
                  ),


                  Rounded_Button (title: 'Register',
                    color: Colors.blueAccent ,
                    onPressed: (){
                    final isvalid= _form.currentState.validate();
                    if(!isvalid) {
                      return;}
                    _form.currentState.save();
                    final valid= _secondForm.currentState.validate();
                    if(!valid) {
                      return;}
                    _secondForm.currentState.save();
                    final lid= _thirdForm.currentState.validate();
                    if(!lid) {
                      return;}
                    _thirdForm.currentState.save();


                    try{
                      _firestore.collection('/users').add({
                      'Name': _name.text,
                      'Phone':_phone.text,
                      'City': _city.text,
                    }).then((value,){
                        setState(() {
                          Showspinner=true;
                        });
                      Navigator.pushNamed(context, MyHomePage.id);
                    });
                    }
                         catch(e){
                         print(e);}

                    setState(() {
                         Showspinner=false;},
                       );
                  },),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:fmiantrader/My_account.dart';
import 'package:fmiantrader/Registration_secreen.dart';
import 'package:fmiantrader/Settings.dart';
import 'package:fmiantrader/about.dart';
import 'package:fmiantrader/items_only.dart';
import 'package:fmiantrader/login_screen.dart';
import 'package:fmiantrader/sp_screen.dart';
import 'package:fmiantrader/welcome.dart';
import 'splash.dart';
import 'categories.dart';
import 'Searchitemsonly.dart';
import 'SearchDeligate.dart';


void main(){
  runApp(MyApp());


}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:MyHomePage.id,
      routes: {
        Login.id:(context)=> Login(),
        Registration.id:(context)=> Registration(),
        Welcome.id:(context)=> Welcome(),
        Sp_screen.id:(context)=> Sp_screen(),
        MyHomePage.id:(context)=> MyHomePage(),
        About.id:(context)=> About(),
        My_account.id:(context)=> My_account(),
        Settings.id:(context)=> Settings(),
        Items.id:(context)=> Items(),
        ItemsOnly.id:(context)=>ItemsOnly(),
        Serchitemsbymod.id:(context)=>Serchitemsbymod(),


      },

    );
  }
}






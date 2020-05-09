import 'package:flutter/material.dart';


class Rounded_Button extends StatelessWidget {
  Rounded_Button({this.color,this.title,@required this.onPressed});
  final Color color;

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(onPressed: onPressed,

          minWidth: 350.0,
          height: 70.0,
          child: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),),
        ),
      ),
    );
  }
}
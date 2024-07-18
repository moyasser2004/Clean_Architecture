import 'package:flutter/material.dart';


class Button extends StatelessWidget {

  final double width;
  final void Function() onPressed;
  final String text;

  const Button({Key? key, required this.width, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Container(
        width: width/1.3,
        child:  Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
          textAlign: TextAlign.center,

        ),
      ),
      onPressed:onPressed,
    );
  }
}

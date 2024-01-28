import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget{

  CustomElevatedButtonWidget ({Key?key,required this.text, required this.onPressed, required this.textStyle, required this.style }) : super (key: key);

  final String text;
  final TextStyle textStyle;
  final Function()? onPressed;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){

      onPressed!();

    },
      child: Text("Sign in" , style: TextStyle(color: Colors.white , fontSize: 18,fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ) ,
      ),
    );
  }
}

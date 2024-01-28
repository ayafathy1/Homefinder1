import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30,),
        Container(
          color: Color(0xffF4F4F4),
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios ,color: Color(0xff6C63FF),) ,),
        ),
      ],
    );
  }

}
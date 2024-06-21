import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GridView1 extends StatelessWidget{
  GridView1( {super.key, Key?Key ,  this.OnTap,required this.gridView, required this.index});

  int index;
  var gridView;
  void Function()? OnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        height:Get.height*0.9,
        width: Get.width*0.4,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
    color:  Color(0xffF7F7F7),),
      child:Stack(
        children:
            [
        Column(
    children: [
          Stack(
            children: [

      Image(image: AssetImage("${gridView.elementAt(index)['image']}"),
    fit: BoxFit.cover,
        width:180,
    ),
              Positioned(
                top: 5,
                right: 3,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),child:  InkWell(
                     onTap:OnTap,
                      child: Image(image: AssetImage("lib/assets/images/close_button.png")),
                    )
                ),
              ) ,
              ]

          ),

    ],
    )
            ],


      ) );
  }
  
}
     
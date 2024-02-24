import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../Widget/custom_arrow_back.dart';

class AddListing extends StatefulWidget {

   AddListing({super.key});

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  Color contColor1=kLightGreyColor;

  Color contColor2=kLightGreyColor;

  Color contColor3=kLightGreyColor;

  Color contColor4=kLightGreyColor;

  Color contColor5=kLightGreyColor;

  Color contColor6=kLightGreyColor;

  Color contColor7=kLightGreyColor;

  Color textColor1 = kDarkBlueColor;

  Color textColor2 = kDarkBlueColor;

  Color textColor3 = kDarkBlueColor;

  Color textColor4 = kDarkBlueColor;

  Color textColor5 = kDarkBlueColor;

  Color textColor6 = kDarkBlueColor;

  Color textColor7 = kDarkBlueColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [SizedBox(height: Get.width*0.13),Row(children: [CustomArrowBack(),SizedBox(width: Get.width*0.1,),Text("Add Listing",style: TextStyle(fontFamily: kRegularFont,fontWeight: FontWeight.w900,fontSize: 23,color: kDarkBlueColor),),
         ],), SizedBox(height: Get.height*0.09,),
        Row(children: [SizedBox(width: Get.width*0.02,),Text(" Fill detail of your ",
          style: TextStyle(fontSize: 20,fontFamily: kRegularFont,fontWeight: FontWeight.w600,color: kDarkBlueColor),),
          Text("real estate ",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: kDarkBlueColor,fontFamily: kRegularFont),)],),
        SizedBox(height: Get.height*0.05,),Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Container(
            height: Get.height*0.15,
            width: Get.width*0.87,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top:Get.height*0.075),
                filled: true,
                fillColor: Color(0xffF4F4F4),
                hintText: "      The Lodge House",
                hintStyle: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                fontSize: 15),

                suffixIcon: Image(image: AssetImage('lib/assets/images/HouseSerchIcon.png')),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color(0xffF4F4F4),
                      width: 3,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color(0xff6C63FF),
                      width: 3,
                    )
                ),
              ),
            ),
          ),
        ),
         SizedBox(height: Get.height*0.01,),
         Padding(
       padding: const EdgeInsets.only(left: 15.0),
       child: Text("Listing type",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
       ),),
         ),SizedBox(height: Get.height*0.02,),
      Row(children: [SizedBox(width: Get.width*0.04,),
        InkWell(onTap:(){
          if (contColor1==kLightGreyColor&&textColor1==kDarkBlueColor){ {

          }  setState(() {
            textColor1=Colors.white;contColor1=kPrimaryColor;
          });}else{setState(() {
            contColor1=kLightGreyColor;
            textColor1=kDarkBlueColor;
          });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor1,border: Border.all(color: contColor1,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Rent",
      style: TextStyle(color: textColor1,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
        InkWell(onTap:(){
          if (contColor2==kLightGreyColor&&textColor2==kDarkBlueColor){ {

          }  setState(() {
            textColor2=Colors.white;contColor2=kPrimaryColor;
          });}else{setState(() {
            contColor2=kLightGreyColor;
            textColor2=kDarkBlueColor;
          });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor2,border: Border.all(color: contColor2,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Sell",
          style: TextStyle(color: textColor2,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],)
        ,SizedBox(height: Get.height*0.045,),Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text("Property category",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
          ),),
        ),SizedBox(height: Get.height*0.02,),Row(children: [SizedBox(width: Get.width*0.04,),
          InkWell(onTap:(){
            if (contColor3==kLightGreyColor&&textColor3==kDarkBlueColor){ {

            }  setState(() {
              textColor3=Colors.white;contColor3=kPrimaryColor;
            });}else{setState(() {
              contColor3=kLightGreyColor;
              textColor3=kDarkBlueColor;
            });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor3,border: Border.all(color: contColor3,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("House",
            style: TextStyle(color: textColor3,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
          InkWell(onTap:(){
            if (contColor4==kLightGreyColor&&textColor4==kDarkBlueColor){ {

            }  setState(() {
              textColor4=Colors.white;contColor4=kPrimaryColor;
            });}else{setState(() {
              contColor4=kLightGreyColor;
              textColor4=kDarkBlueColor;
            });}},child: Container(width: 93,height: 50,decoration: BoxDecoration(color:contColor4,border: Border.all(color: contColor4,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Apartment",
            style: TextStyle(color: textColor4,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],)
      ,SizedBox(height: Get.height*0.017,)
        ,Row(children: [SizedBox(width: Get.width*0.04,),
          InkWell(onTap:(){
            if (contColor5==kLightGreyColor&&textColor5==kDarkBlueColor){ {

            }  setState(() {
              textColor5=Colors.white;contColor5=kPrimaryColor;
            });}else{setState(() {
              contColor5=kLightGreyColor;
              textColor5=kDarkBlueColor;
            });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor5,border: Border.all(color:contColor5,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Hotel",
            style: TextStyle(color: textColor5,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
          InkWell(onTap:(){
            if (contColor6==kLightGreyColor&&textColor6==kDarkBlueColor){ {

            }  setState(() {
              textColor6=Colors.white;contColor6=kPrimaryColor;
            });}else{setState(() {
              contColor6=kLightGreyColor;
              textColor6=kDarkBlueColor;
            });}},child: Container(width: 73,height: 50,decoration:
          BoxDecoration(color:contColor6,border:
          Border.all(color: contColor6,width:1 ),
              borderRadius: BorderRadius.circular(15) ),
            child: Center(child: Text("Villa",
            style: TextStyle(color:textColor6,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
         SizedBox(width: Get.width*0.025,), InkWell(onTap:(){
           if (contColor7==kLightGreyColor&&textColor7==kDarkBlueColor){ {

         }  setState(() {
            textColor7=Colors.white;contColor7=kPrimaryColor;
         });}else{setState(() {
             contColor7=kLightGreyColor;
             textColor7=kDarkBlueColor;
         });}},child: Container(width: 93,height: 50,decoration: BoxDecoration(color:contColor7,border: Border.all(color: contColor7,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Cottage",
            style: TextStyle(color: textColor7,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),) ],),
      SizedBox(height: Get.height*0.09,),
      Center(
        child: Container(
          width: 210,
          height: 64,
          decoration: BoxDecoration(color: kPrimaryColor,border: Border.all(color: kPrimaryColor,width: 1),borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(child:Text( "Next",style: TextStyle(color: Colors.white,fontFamily: kRegularFont,fontSize: 20,fontWeight: FontWeight.w700,),), onPressed: (){},
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
              fixedSize: Size(200,70))),
        ),
      )],),
    ),);
  }
}

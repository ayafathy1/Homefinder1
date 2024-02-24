import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/widget/box_widget.dart';
import 'package:homefinder1/Screens/add_listing/add_listing_screen.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../Widget/custom_bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Column(children: [
      Row(children: [Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: IconButton(onPressed: (){},
          icon: Image(image: AssetImage("lib/assets/images/locationIcon 1.png"),
            width: 28,height: 28,fit: BoxFit.fill,)),

    ),Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,children: [
          TextButton(onPressed: (){},
          child: Text("Location",style: TextStyle(color: kPrimaryColor,
              fontFamily: kRegularFont,fontSize: 18,fontWeight: FontWeight.w700),)),
           Text("Manhattan, New York",style: TextStyle(fontSize: 12,fontFamily:
           kRegularFont,fontWeight: FontWeight.w700),) ],),
    ),
        Padding(
      padding: const EdgeInsets.only(top: 10.0,bottom: 8.0,left: 40.0),
      child: InkWell(child: Container(child: Center(child: Image(image:
      AssetImage("lib/assets/images/ion_notifications-outline.png")
        ,width: 28, height: 28,fit: BoxFit.fill,)),
        width: 52,height: 52,decoration:
      BoxDecoration(color: Colors.white,border:
      Border.all(color: kPrimaryColor,width: 1.5,),
          borderRadius: BorderRadius.circular(55)),),),
    ),
      Padding(
      padding: const EdgeInsets.only(top: 10.0,bottom: 8.0,left: 10.0),
      child: InkWell(child: Container(child: Column(children: [Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Image(image:
        AssetImage("lib/assets/images/ChatNotifIcon.png"),width: 23,height: 23,),
      ),Text("Chat",style: TextStyle(fontFamily: kRegularFont,
          fontWeight: FontWeight.w700,fontSize: 11),)],),width: 52,
        height: 52,decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: kPrimaryColor,width: 1.5,),
            borderRadius: BorderRadius.circular(55)),),),
    ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 8.0,left: 10.0),
        child: InkWell(onTap: (){Get.to(()=>AddListing());},child: Container(width: 52,height: 52,decoration:
        BoxDecoration(image: DecorationImage(image:
        AssetImage("lib/assets/images/Add Home.png")),color: kPrimaryColor,
            border: Border.all(color: kPrimaryColor,width: 1.5,),
            borderRadius: BorderRadius.circular(55)),),),
      ),],),
      SizedBox(height: 10,),
      Container(width: Get.width*0.96,height: 109,
        child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0,left: 22),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

              Text("Discover",style: TextStyle(color: Colors.white,
                  fontFamily: kRegularFont,fontWeight: FontWeight.w900,
                  fontSize: 18),),
              Text("Find your",style: TextStyle(color: Colors.white,
                  fontFamily: kRegularFont,fontWeight: FontWeight.w900,
                  fontSize: 23),),
              Text("Best Living Places.",style: TextStyle(color: Colors.white,
                  fontFamily: kRegularFont,fontWeight: FontWeight.w900,
                  fontSize: 23),)],),
          ),SizedBox(width: 47,),Image(image:
          AssetImage("lib/assets/images/HomeRecImage.png"),)],),
        decoration: BoxDecoration(
          color: kDarkBlueColor,border: Border.all(color: kDarkBlueColor),
            borderRadius: BorderRadius.circular(20)),),
    SizedBox(height: 8,)
    ,Container(
           width: Get.width*0.95,
           height: 60,
           child: TextField(
             keyboardType: TextInputType.text,
             decoration: InputDecoration(
               filled: true,
               fillColor: Color(0xffF4F4F4),
               hintText: "Search House, Apartment , etc",
               prefixIcon: Icon(Icons.search_outlined , color: Colors.black,),
               suffixIcon: InkWell(
                   onTap: (){},
                   child: Image(image: AssetImage('lib/assets/images/options.png'))),
               enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                   borderSide: BorderSide(
                     color: Color(0xffF4F4F4),
                     width: 3,
                   )
               ),
               focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                   borderSide: BorderSide(
                     color: Color(0xff6C63FF),
                     width: 3,
                   )
               ),
             ),
           ),
         ),
      SizedBox(height: 8,),
      Row(children: [SizedBox(width: 15,),
        Container(child: Center(child:Text("House",style: TextStyle(color: Colors.white
        ,fontWeight: FontWeight.w800,fontFamily: kRegularFont,fontSize: 15),
        )),height: 55,width: 80,
          decoration: BoxDecoration(color: kPrimaryColor,border:
          Border.all(color: kPrimaryColor),borderRadius: BorderRadius.circular(10.69)
          ,boxShadow: [BoxShadow(color: Colors.grey,
                  offset: Offset(0, 0),
                  blurRadius: 20)]),),
        SizedBox(width: 18,),
        Container(child: Center(child:Text("Apartment",style: TextStyle(color:kGreyColor
            ,fontWeight: FontWeight.w600,fontFamily: kRegularFont,fontSize: 15),
        )),height: 50,width: 100,
          decoration: BoxDecoration(color: kVeryLightGreyColor,border:
          Border.all(color: Color(0xffF4F4F4)),borderRadius: BorderRadius.circular(10.69)
              ,),), SizedBox(width: 10,),
        Container(child: Center(child:Text("Hotel",style: TextStyle(color:kGreyColor
            ,fontWeight: FontWeight.w600,fontFamily: kRegularFont,fontSize: 15),
        )),height: 50,width: 80,
          decoration: BoxDecoration(color: kVeryLightGreyColor,border:
          Border.all(color: Color(0xffF4F4F4))
            ,borderRadius: BorderRadius.circular(10.69)
            ,),),SizedBox(width: 10,),
        Container(child: Center(child:Text("Villa",style: TextStyle(color:kGreyColor
            ,fontWeight: FontWeight.w600,fontFamily: kRegularFont,fontSize: 15),
        )),height: 50,width: 80,
          decoration: BoxDecoration(color: kVeryLightGreyColor,border:
          Border.all(color: Color(0xffF4F4F4))
            ,borderRadius: BorderRadius.circular(10.69)
            ,),)],),

      Row(children: [SizedBox(width: 10,),Text("Popular Nearest You",style:
      TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w900,
          fontSize: 20),),SizedBox(width:85, ),TextButton(onPressed: (){}, child:Text("View All",
        style: TextStyle(color: kPrimaryColor,fontSize: 18,
            fontWeight: FontWeight.w800,fontFamily: kRegularFont),)),
      ],),
      Container(child: ListView.builder(physics: BouncingScrollPhysics(),itemCount: 3,scrollDirection: Axis.horizontal,itemBuilder:(context, index) {
        return Row(
          children: [
            SizedBox(width: 10,),
            InkWell(child: Container(decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF5F5F5)),borderRadius: BorderRadius.circular(20)
            ,color: kVeryLightGreyColor),width: 250,height: Get.height*0.27 ,child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
              children: [Container(height: 130,width: 250,child: Image(image: AssetImage("lib/assets/images/Home Photo.png"),width:280,height: 140,fit: BoxFit.fill,),),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Lorem House",style: TextStyle(color: Color(0xff2F2F2F),fontFamily: kRegularFont,
                    fontWeight: FontWeight.w600,fontSize: 17),),
              ),SizedBox(height: 2,),Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 3),
                child: Text("\$340/month",style: TextStyle(color: kPrimaryColor,
                    fontSize: 12,fontWeight: FontWeight.w700,fontFamily: kRegularFont),),
              ),Row(mainAxisAlignment: MainAxisAlignment.start,children: [SizedBox(width: 8,height: 3,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Icon(Icons.location_on_outlined,color: kGreyColor,size: 16,),
                  )
                ,Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Avenue, West Side",style: TextStyle(color: kGreyColor,
                        fontFamily: kRegularFont,fontSize: 13,fontWeight: FontWeight.w500),),
                ),
                SizedBox(width: 50,),
                IconButton(onPressed: (){}, icon:Icon( Icons.favorite_rounded,color: kGreyColor,size: 27,)),
               ],)],),),),
            SizedBox(width: 5,),],
        );
      }, ),width: Get.width,height: Get.height*0.28,),
      Row(children: [SizedBox(width: 10,),Text("Featured Estates",style:
      TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w900,
          fontSize: 20),),SizedBox(width: 120, ),TextButton(onPressed: (){}, child:Text("View All",
        style: TextStyle(color: kPrimaryColor,fontSize: 18,
            fontWeight: FontWeight.bold,fontFamily: kRegularFont),)),
      ],),
      Container(width: Get.width,height: Get.height*0.1402,
      child: ListView.builder(itemCount: 4,physics: BouncingScrollPhysics(),scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(
      children: [
        Container(width:Get.width*0.95,height: Get.height*0.15,
          decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)
          ,border: Border.all(color: Colors.white),boxShadow: [BoxShadow(color: Colors.grey,
                  offset: Offset(0, 0),
                  blurRadius: 10)]) ,child: Row(mainAxisAlignment: MainAxisAlignment.start
            ,children: [Container(width: 110,height: 110,child: Image(image: AssetImage("lib/assets/images/Villa.png"),fit: BoxFit.fill,)),
            Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: 3,),Row(children: [SizedBox(width: 5,),Icon(Icons.star,color:Color(0xffEEA651),),SizedBox(width: 2,),Text("5",
              style: TextStyle(color:kGreyColor,fontFamily: kRegularFont,fontWeight: FontWeight.w600),),SizedBox(width: 148,),
            Container(height: 30,width: 90,decoration: BoxDecoration(color: Color(0xffF4F6F9),border:
            Border.all(color: Color(0xffF4F6F9),),borderRadius:
            BorderRadius.circular(25)),child: Center(
              child: Text("Apartment",
                style: TextStyle(color: kPrimaryColor,fontSize: 12,fontWeight: FontWeight.w600,fontFamily: kRegularFont),),
            ),)],),Row(
              children: [
                SizedBox(width: 5,),
                Text("Woodland Apartment"
                ,style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w700
                ,fontSize: 16),),
              ],
            ),Row(children: [SizedBox(width: 5,),Icon(Icons.location_on,color: Color(0xff415770),size: 17,),Text("1012 Ocean avanue, New yourk, USA",
            style: TextStyle(color: Color(0xff415770),fontSize: 12,fontFamily:kRegularFont,fontWeight: FontWeight.w500),)],),
        Row(children: [SizedBox(width: 5,),Text("\$340/month"
            ,style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w700,fontSize: 13,fontFamily: kRegularFont),),
              SizedBox(width: 135,),IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded,
              color: kGreyColor,size: 25,))],)],)],),),
        SizedBox(height: 10,)
      ],
    );}),)


    ],),
    bottomNavigationBar: CustomBottomNavigationBarWidget(),);

  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';

import '../../utilities/constants.dart';
import '../add listing - photos/widget/grid_view.dart';

class EditListingScreen extends StatefulWidget{

  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {


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

  Color garden = kDarkBlueColor ;

  Color gardenText = kDarkBlueColor;

  Color gym = kDarkBlueColor ;

  Color gymText = kDarkBlueColor;

  Color homeTheatre = kDarkBlueColor ;

  Color homeTheatreText = kDarkBlueColor;

  Color kidsFriend = kDarkBlueColor ;

  Color kidsFriendText = kDarkBlueColor;

  Color hotel = kDarkBlueColor ;

  Color hotelText = kDarkBlueColor;

  Color villa = kDarkBlueColor ;

  Color villaText = kDarkBlueColor;

  Color cottege = kDarkBlueColor ;

  Color cottegeText = kDarkBlueColor;

  Color house = kDarkBlueColor ;

  Color houseText = kDarkBlueColor;

  Color apartment = kDarkBlueColor ;

  Color apartmentText = kDarkBlueColor;


  Color bed2 = kDarkBlueColor;

  Color bedtext2 = kDarkBlueColor;

  final List gridview = [
    {
      "image" : "lib/assets/images/Shape1.png",
    },
    {
      "image" : "lib/assets/images/Shape2.png",
    },
    {
      "image" : "lib/assets/images/Shape3.png",
    }
  ];

  final List gridview1 = [
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "2",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "3",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "4",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "5",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "6",
    },
  ];


  var selectedIndex;

  int counter1 = 1;
  int counter2 = 1;
  int counter3 = 1;

  void incrementCounter1() {
    setState(() {
      counter1++;
    });
  }

  void decrementCounter1() {
    setState(() {
      counter1--;
    });
  }

  void incrementCounter2() {
    setState(() {
      counter2++;
    });
  }

  void decrementCounter2() {
    setState(() {
      counter2--;
    });
  }

  void incrementCounter3() {
    setState(() {
      counter3++;
    });
  }

  void decrementCounter3() {
    setState(() {
      counter3--;
    });
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: Get.width*0.13),
           Row(
             children: [
               CustomArrowBack(),
               SizedBox(width: Get.width*0.1,),
               Text("Edit Listing",style: TextStyle(fontFamily: kRegularFont,fontWeight: FontWeight.w900,fontSize: 23,color: kDarkBlueColor),),
             ],
           ),
           SizedBox(
             height: 30,
           ),
           Container(
             width:Get.width*0.95,
             height: Get.height*0.15,
             decoration:BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15)
                 ,border: Border.all(color: Colors.white),
                 boxShadow: [BoxShadow(color: Colors.grey,
                     offset: Offset(0, 0),
                     blurRadius: 10)]) ,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start
               ,children: [
                 SizedBox(width: 3,),
               Container
                 (width: 105,height: 115,
                   child: Stack(children:[
                     Image(image: AssetImage("lib/assets/images/Villa.png"),
                       height: 115,
                       fit: BoxFit.contain,),
                     Positioned(
                       top: 5,
                       right: 8,
                       child:InkWell(
                           child: Image(image: AssetImage("lib/assets/images/coloredHeart.png"))),
                     )

                   ] )),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 3,),
                     Row(children: [
                       SizedBox(width: 5,),
                       Icon(Icons.star,color:Color(0xffEEA651),),
                       SizedBox(width: 1,),Text("4.9",
                     style: TextStyle(color:kGreyColor,fontFamily: kRegularFont,fontWeight: FontWeight.w600),),SizedBox(width: 148,),
                     Container(height: 30,width: 60,
                       decoration: BoxDecoration(
                           color: Color(0xffF4F6F9),border:
                     Border.all(color: Color(0xffF4F6F9),),borderRadius:
                     BorderRadius.circular(25)),
                       child: Center(
                       child: Text("Villa",
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
                       SizedBox(width: 135,),
                       ],)],)],),),
           SizedBox(height: 50,),
           Row(
             children: [
               SizedBox(width: 40,),
               Text("Listing Title" , style: TextStyle(
                 fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
               ),),
             ],
           ),
             SizedBox(height: 10,),
           Center(
             child: Container(
               height: Get.height*0.15,
               width: Get.width*0.87,
               child: TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top:Get.height*0.075),
                   filled: true,
                   fillColor: Color(0xffF4F4F4),
                   hintText: "      Schoolview House",
                   hintStyle: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                       fontSize: 15),

                   suffixIcon: Image(image: AssetImage('lib/assets/images/House.png')),
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
           SizedBox(height: 5,),
           Row(
             children: [
               SizedBox(width: 40,),
               Text("Listing Type" ,
                   style: TextStyle(
                     fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,)),
             ],
           ),

           SizedBox(height: 15,),

           Row(

             children: [SizedBox(width: 40,),
               InkWell(onTap:(){
                 if (contColor3==kLightGreyColor&&textColor3==kDarkBlueColor){ {

                 }  setState(() {
                   textColor3=Colors.white;contColor3=kPrimaryColor;
                 });}else{setState(() {
                   contColor3=kLightGreyColor;
                   textColor3=kDarkBlueColor;
                 });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor3,border: Border.all(color: contColor3,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Rent",
                 style: TextStyle(color: textColor3,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
               SizedBox(width: 20,),
               InkWell(onTap:(){
                 if (contColor4==kLightGreyColor&&textColor4==kDarkBlueColor){ {

                 }  setState(() {
                   textColor4=Colors.white;contColor4=kPrimaryColor;
                 });}else{setState(() {
                   contColor4=kLightGreyColor;
                   textColor4=kDarkBlueColor;
                 });}},child: Container(width: 93,height: 50,decoration: BoxDecoration(color:contColor4,border: Border.all(color: contColor4,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Sell",
                 style: TextStyle(color: textColor4,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
             ],
           ),

           SizedBox(height: 30,),

           Row(
             children: [
               SizedBox(width: 40,),
               Text("Property Category" , style: TextStyle(
             fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,)),

             ],
           ),
           SizedBox(height: 10,),
           Row(children: [SizedBox(width: Get.width*0.07,),
             InkWell(onTap:(){
               if (house==kLightGreyColor&&houseText==kDarkBlueColor){ {

               }  setState(() {
                 houseText=Colors.white;house=kPrimaryColor;
               });}else{setState(() {
                 house=kLightGreyColor;
                 houseText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:house,border: Border.all(color: house,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("House",
               style: TextStyle(color: houseText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
             SizedBox(width: 20,),
             InkWell(onTap:(){
               if (apartment==kLightGreyColor&&apartmentText==kDarkBlueColor){ {

               }  setState(() {
                 apartmentText=Colors.white;apartment=kPrimaryColor;
               });}else{setState(() {
                 apartment=kLightGreyColor;
                 apartmentText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:apartment,border: Border.all(color: apartment,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Apartment",
               style: TextStyle(color: apartmentText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),

           SizedBox(height: 20,),
           Row(children: [SizedBox(width: Get.width*0.04,),
             InkWell(onTap:(){
               if (hotel==kLightGreyColor&&hotelText==kDarkBlueColor){ {

               }  setState(() {
                 hotelText=Colors.white;hotel=kPrimaryColor;
               });}else{setState(() {
                 hotel=kLightGreyColor;
                 hotelText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:hotel,border: Border.all(color: hotel,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Hotel",
               style: TextStyle(color: hotelText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
             SizedBox(width: 30,),
             InkWell(onTap:(){
               if (villa==kLightGreyColor&&villaText==kDarkBlueColor){ {

               }  setState(() {
                 villaText=Colors.white;villa=kPrimaryColor;
               });}else{setState(() {
                 villa=kLightGreyColor;
                 villaText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:villa,border: Border.all(color: villa,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Villa",
               style: TextStyle(color: villaText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
             SizedBox(width: 30,),
             InkWell(onTap:(){
               if (cottege==kLightGreyColor&&cottegeText==kDarkBlueColor){ {

               }  setState(() {
                 cottegeText=Colors.white;contColor5=kPrimaryColor;
               });}else{setState(() {
                 cottege=kLightGreyColor;
                 cottegeText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:cottege,border: Border.all(color: cottege,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Cottage",
               style: TextStyle(color: cottegeText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),

        SizedBox(height: 10,),
           Row(
             children: [
               SizedBox(width: 10,),
               Text("Location" ,style: TextStyle(
                 fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,

                    ),),
             ],
           ),


           SizedBox(height: 50,),


           Row(children: [
             SizedBox(width: 20,),
             Text("Listing Photos" , style: TextStyle(
               fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,)),

           ],),

           SizedBox(height: 10,),


           Center(
             child: Container(
               height: 450,
               color: Color(0xffF7F7F7),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     crossAxisSpacing: 8 , mainAxisSpacing: 8 ,mainAxisExtent: 200
                 ),
                   itemCount: gridview.length,
                   itemBuilder: (BuildContext context, int index) {
                     return GridView1(gridView: gridview, index: index);
                   },
                 ),
               ),
             ),
           ),

           SizedBox(height: 10,),

           Text("    sell price" , style: TextStyle(
               fontSize: 20 , fontFamily: kRegularFont,fontWeight: FontWeight.w600,
               color: kDarkBlueColor
           ),),
           SizedBox(height: 10,),
           Center(
             child: Container(
               height: Get.height*0.15,
               width: Get.width*0.87,
               child: TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top:Get.height*0.075),
                   filled: true,
                   fillColor: Color(0xffF4F4F4),
                   hintText: "      \$ 100,000",
                   hintStyle: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                       fontSize: 15),

                   suffixIcon: Image(image: AssetImage('lib/assets/images/dollar sign.png')),
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

           Text("    Rent Price" , style: TextStyle(
               fontSize: 20 , fontFamily: kRegularFont,fontWeight: FontWeight.w600,
               color: kDarkBlueColor
           ),),
           SizedBox(height: 10,),
           Center(
             child: Container(
               height: Get.height*0.15,
               width: Get.width*0.87,
               child: TextField(
                 keyboardType: TextInputType.text,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top:Get.height*0.075),
                   filled: true,
                   fillColor: Color(0xffF4F4F4),
                   hintText: "      \$ 3l5/month",
                   hintStyle: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                       fontSize: 15),

                   suffixIcon: Image(image: AssetImage('lib/assets/images/dollar sign.png')),
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

           Row(

             children: [SizedBox(width: 40,),
               InkWell(onTap:(){
                 if (contColor3==kLightGreyColor&&textColor3==kDarkBlueColor){ {

                 }  setState(() {
                   textColor3=Colors.white;contColor3=kPrimaryColor;
                 });}else{setState(() {
                   contColor3=kLightGreyColor;
                   textColor3=kDarkBlueColor;
                 });}},child: Container(width: 73,height: 50,decoration: BoxDecoration(color:contColor3,border: Border.all(color: contColor3,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Monthly",
                 style: TextStyle(color: textColor3,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
               SizedBox(width: 20,),
               InkWell(onTap:(){
                 if (contColor4==kLightGreyColor&&textColor4==kDarkBlueColor){ {

                 }  setState(() {
                   textColor4=Colors.white;contColor4=kPrimaryColor;
                 });}else{setState(() {
                   contColor4=kLightGreyColor;
                   textColor4=kDarkBlueColor;
                 });}},child: Container(width: 93,height: 50,decoration: BoxDecoration(color:contColor4,border: Border.all(color: contColor4,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Yearly",
                 style: TextStyle(color: textColor4,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),

             ],
           ),

           SizedBox(height: Get.height*0.045,),
           Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Text("  Property Features",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
             )),),
           SizedBox(height: 10,),
           Center(
             child: Container(
               height: Get.height*0.11,
               width: Get.width*0.87,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
                 color: Color(0xffF4F4F4),
               ),

               child:
               Row(
                 children: [
                   Text("   Bedroom" , style:  TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                       fontSize: 15),),
                   SizedBox(width: 170,),
                   InkWell(
                     onTap: (){
                       decrementCounter1();
                     },
                     child: Image(image: AssetImage('lib/assets/images/Delete - Icon.png'),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Text('$counter1' , style: TextStyle(fontSize: 20),),
                   SizedBox(width: 10,),
                   InkWell(
                       onTap: (){
                         incrementCounter1();
                       },
                       child: Image(image: AssetImage('lib/assets/images/Add - Icon.png')))
                 ],
               ),


             ),
           ),
           SizedBox(height: 30,),


           Center(
             child: Container(
               height: Get.height*0.11,
               width: Get.width*0.87,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
                 color: Color(0xffF4F4F4),
               ),

               child:
               Row(
                 children: [
                   Text("   Bathroom" , style:  TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                       fontSize: 15),),
                   SizedBox(width: 160,),
                   InkWell(
                     onTap: (){
                       decrementCounter2();
                     },
                     child: Image(image: AssetImage('lib/assets/images/Delete - Icon.png'),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Text('$counter2' , style: TextStyle(fontSize: 20),),
                   SizedBox(width: 10,),
                   InkWell(
                       onTap: (){
                         incrementCounter2();
                       },
                       child: Image(image: AssetImage('lib/assets/images/Add - Icon.png')))
                 ],
               ),


             ),
           ),
           SizedBox(height: 30,),

           Center(
             child: Container(
               height: Get.height*0.11,
               width: Get.width*0.87,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
                 color: Color(0xffF4F4F4),
               ),

               child:
               Row(
                 children: [
                   Text("   Balcony" , style:  TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w800,
                       fontSize: 15),),
                   SizedBox(width: 180,),
                   InkWell(
                     onTap: (){
                       decrementCounter3();
                     },
                     child: Image(image: AssetImage('lib/assets/images/Delete - Icon.png'),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Text('$counter3' , style: TextStyle(fontSize: 20),),
                   SizedBox(width: 10,),
                   InkWell(
                       onTap: (){
                         incrementCounter3();
                       },
                       child: Image(image: AssetImage('lib/assets/images/Add - Icon.png')))
                 ],
               ),


             ),
           ),

           SizedBox(height: 30,),


           Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Text("  Total Rooms",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
             )),),

           Container(
             height: 90,
             decoration: BoxDecoration(
               color: Colors.white38,

             ),

             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: GridView.builder(
                   scrollDirection: Axis.horizontal,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ,mainAxisSpacing: 20),
                   itemCount: gridview1.length,
                   itemBuilder:  (_ , index) {
                     return InkWell(onTap:(){

                       selectedIndex = index;
                       setState(() {

                       });
                     },child: Container(width: 100,height: 70,
                       decoration: BoxDecoration(
                           color: selectedIndex ==index?kPrimaryColor:kLightGreyColor,
                           border: Border.all(color: Colors.transparent,width:1 ),
                           borderRadius: BorderRadius.circular(15) ),
                       child: Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(15.0),
                             child: Image(image: AssetImage("${gridview1.elementAt(index)['image']}")),
                           ),

                           Center(child: Text("${gridview1.elementAt(index)['number']}",
                             style: TextStyle(color: selectedIndex==index?Colors.white:kDarkBlueColor,
                                 fontFamily: kRegularFont,
                                 fontWeight: FontWeight.w800,
                                 fontSize: 13),)),
                         ],
                       ),),);


                   }),
             ),
           ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Text("  Enviroment/Facilites",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontFamily: kRegularFont,color: kDarkBlueColor,
             )),),
           SizedBox(height: 10,),
           Row(children: [SizedBox(width: Get.width*0.07,),
             InkWell(onTap:(){
               if (contColor1==kLightGreyColor&&textColor1==kDarkBlueColor){ {

               }  setState(() {
                 textColor1=Colors.white;contColor1=kPrimaryColor;
               });}else{setState(() {
                 contColor1=kLightGreyColor;
                 textColor1=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:contColor1,border: Border.all(color: contColor1,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Parking Lot",
               style: TextStyle(color: textColor1,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
             SizedBox(width: 50,),
             InkWell(onTap:(){
               if (contColor2==kLightGreyColor&&textColor2==kDarkBlueColor){ {

               }  setState(() {
                 textColor2=Colors.white;contColor2=kPrimaryColor;
               });}else{setState(() {
                 contColor2=kLightGreyColor;
                 textColor2=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:contColor2,border: Border.all(color: contColor2,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Pet Allowed",
               style: TextStyle(color: textColor2,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),
           SizedBox(height: 20,),
           Row(children: [SizedBox(width: Get.width*0.04,),
             InkWell(onTap:(){
               if (garden==kLightGreyColor&&gardenText==kDarkBlueColor){ {

               }  setState(() {
                 gardenText=Colors.white;garden=kPrimaryColor;
               });}else{setState(() {
                 garden=kLightGreyColor;
                 gardenText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:garden,border: Border.all(color: garden,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Garden",
               style: TextStyle(color: gardenText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
             SizedBox(width: 30,),
             InkWell(onTap:(){
               if (gym==kLightGreyColor&&gymText==kDarkBlueColor){ {

               }  setState(() {
                 gymText=Colors.white;gym=kPrimaryColor;
               });}else{setState(() {
                 gym=kLightGreyColor;
                 gymText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:gym,border: Border.all(color: gym,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Gym",
               style: TextStyle(color: gymText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),
             SizedBox(width: 30,),
             InkWell(onTap:(){
               if (contColor5==kLightGreyColor&&textColor5==kDarkBlueColor){ {

               }  setState(() {
                 textColor5=Colors.white;contColor5=kPrimaryColor;
               });}else{setState(() {
                 contColor5=kLightGreyColor;
                 textColor5=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:contColor5,border: Border.all(color: contColor5,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Park",
               style: TextStyle(color: textColor5,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),
           SizedBox(height: 20,),

           Row(children: [SizedBox(width: Get.width*0.08,),
             InkWell(onTap:(){
               if (homeTheatre==kLightGreyColor&&homeTheatreText==kDarkBlueColor){ {

               }  setState(() {
                 homeTheatreText=Colors.white;homeTheatre=kPrimaryColor;
               });}else{setState(() {
                 homeTheatre=kLightGreyColor;
                 homeTheatreText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:homeTheatre,border: Border.all(color: homeTheatre,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Home Theatre",
               style: TextStyle(color: homeTheatreText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),),SizedBox(width: Get.width*0.025,),
             SizedBox(width: 50,),
             InkWell(onTap:(){
               if (kidsFriend==kLightGreyColor&&kidsFriendText==kDarkBlueColor){ {

               }  setState(() {
                 kidsFriendText=Colors.white;kidsFriend=kPrimaryColor;
               });}else{setState(() {
                 kidsFriend=kLightGreyColor;
                 kidsFriendText=kDarkBlueColor;
               });}},child: Container(width: 100,height: 70,decoration: BoxDecoration(color:kidsFriend,border: Border.all(color: kidsFriend,width:1 ),borderRadius: BorderRadius.circular(15) ),child: Center(child: Text("Kid's friendly",
               style: TextStyle(color: kidsFriendText,fontFamily: kRegularFont,fontWeight: FontWeight.w800,fontSize: 12),)),),)],),

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
           ),
         ],),


       ),
     );

  }
}
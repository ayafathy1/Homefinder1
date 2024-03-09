import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';

import '../../utilities/colors.dart';
import '../../utilities/constants.dart';
import 'controller/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<FavoriteController>(
        init: FavoriteController(),
    builder: (FavoriteController controller) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomArrowBack(),
        leadingWidth: 80,
        title:  Text("Favourites",style: TextStyle(
          color: kDarkBlueColor,
          fontSize: 20,
          fontFamily: kRegularFont,
          fontWeight: FontWeight.w900,
        ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: controller.scroll,
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(left: 5,top: 20),width: Get.width,height: Get.height*0.059,child:
              ListView.separated(physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                return InkWell(
                  onTap:(){
                    controller.favCategory(index);
                  } ,
                  child: Container(
                    padding: EdgeInsets.only(left: 23,right: 23),
                    height: 17,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: controller.selectedIndex==index?Colors.grey.shade500:Colors.transparent,
                              offset: Offset(0, 0),
                              blurRadius: 10)
                        ],
                      color: controller.selectedIndex==index?kPrimaryColor:kLightGreyColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(child: Text(controller.types[index],style: TextStyle(
                      color: controller.selectedIndex==index?Colors.white:kDarkBlueColor,
                      fontSize: 15,
                      fontFamily: kRegularFont,
                      fontWeight: FontWeight.w600,
                    ))),
                  ),
                );
              }, separatorBuilder: (context,index){
                return SizedBox(width: 5,);
              }, itemCount: controller.types.length)
              ,),
            Container(margin: EdgeInsets.only(top: 15),width: Get.width,height: Get.height,
              child: ListView.builder(controller: controller.scroll,itemCount: 10,physics: BouncingScrollPhysics(),scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(width:Get.width*0.95,height: Get.height*0.15,
                          decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)
                              ,border: Border.all(color: Colors.white),boxShadow: [BoxShadow(color: Colors.grey,
                                  offset: Offset(0, 0),
                                  blurRadius: 10)]) ,child: Row(mainAxisAlignment: MainAxisAlignment.start
                            ,children: [SizedBox(width: 3,),Container(width: 105,height: 115,child: Image(image: AssetImage("lib/assets/images/Villa.png"),fit: BoxFit.fill,)),
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
                                      color: kPrimaryColor,size: 25,))],)],)],),),
                        SizedBox(height: 10,)
                      ],
                    );}),)
          ],
        ),
      ),
    );});
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/single%20detail/controller/single_detail_controller.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../utilities/colors.dart';

class SingleDetailScreen extends StatefulWidget{
  @override
  State<SingleDetailScreen> createState() => _SingleDetailScreenState();
}

class _SingleDetailScreenState extends State<SingleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleDetailController>(
      init: SingleDetailController(),
        builder: (SingleDetailController controller){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: Stack(
                    children:  <Widget> [
                      Container(
                          child:
                          Image(image: AssetImage('lib/assets/images/apartment.png'),
                            width: double.infinity,
                            fit: BoxFit.cover,)),

                      Positioned(
                          top: 50,
                          left: 20,
                          child:InkWell(
                            onTap: (){},
                            child: Image(image: AssetImage("lib/assets/images/Icon Back.png")),
                          )
                      ),

                      Positioned(
                        top: 50,
                        right: 20,
                        child: InkWell(
                          onTap: (){},
                          child: Image(image: AssetImage('lib/assets/images/greyheart.png')),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                            onTap: (){},
                            child:
                            Image(image: AssetImage('lib/assets/images/complete-apartment.png'))),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                    children: [
                      SizedBox(width: 35,),
                      Icon(Icons.star,color:Color(0xffEEA651),)
                      ,SizedBox(width: 2,),
                      Text("4 (6.8K review)",style: TextStyle(color:kGreyColor,fontFamily: kRegularFont,fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 130,),
                      Container(height: 30,width: 90,decoration: BoxDecoration(color: Color(0xffF4F6F9),border:
                      Border.all(color: Color(0xffF4F6F9),),borderRadius:
                      BorderRadius.circular(25)),child: Center(
                        child: Text("Apartment",
                          style: TextStyle(color: kPrimaryColor,fontSize: 12,fontWeight: FontWeight.w600,fontFamily: kRegularFont),),
                      ))
                    ]
                ),

                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Text("Woodland Apartment" , style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w700
                        ,fontSize: 20),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Text("1012 Ocean avaneu, New york, USA" , style: TextStyle(color: Color(0xff415770),fontSize: 12,fontFamily:kRegularFont,fontWeight: FontWeight.w500) )
                  ],
                ),

                SizedBox(height: 5,),

                Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: Get.width * 0.93,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: ListView.separated(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 6, bottom: 6),
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.selectedIndex = index;
                                  controller.descriptionGalleryReview();
                                  setState(() {});
                                },
                                child: Center(
                                  child: Text(
                                    controller.pOrLOrS[index],
                                    style: TextStyle(
                                        color: controller.selectedIndex == index
                                            ? kPrimaryColor
                                            : kDarkBlueColor,
                                        fontFamily: kRegularFont,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              );
                            },
                            dragStartBehavior:DragStartBehavior.down ,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 60);
                            },
                            itemCount: controller.pOrLOrS.length),
                      ),

                    )),
                  Divider(
                  color:controller.selectedIndex == controller.pOrLOrS
                      ? kPrimaryColor
                      : kGreyColor,
                ),

                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                  width: Get.width,
                  height: Get.height * 0.3,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return controller.listViewItem[index];

                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 500,
                        );
                      },
                      itemCount: 1),
                )




              ],
            ),
          ),
        );
        }

    );


  }
}
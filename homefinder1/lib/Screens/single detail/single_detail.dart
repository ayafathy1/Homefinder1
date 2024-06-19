// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/single%20detail/controller/single_detail_controller.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../utilities/colors.dart';

class SingleDetailScreen extends StatefulWidget{

  String resId;
  int Id;
  SingleDetailScreen( this.Id,this.resId);

  @override
  State<SingleDetailScreen> createState() => _SingleDetailScreenState();
}

class _SingleDetailScreenState extends State<SingleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleDetailController>(
      init: SingleDetailController(widget.Id,widget.resId,context),
        builder: (SingleDetailController controller){
        return Scaffold(
          body: SingleChildScrollView(
            controller: controller.scroll,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: Stack(
                    children:  <Widget> [
                      const Image(image: AssetImage('lib/assets/images/apartment.png'),
                        width: double.infinity,
                        fit: BoxFit.cover,),

                      Positioned(
                          top: 50,
                          left: 20,
                          child:InkWell(

                            onTap: (){
                              Get.back();
                            },
                            child: Image(image: AssetImage("lib/assets/images/Icon Back.png")),

                          )
                      ),

                      Positioned(
                        top: 50,
                        right: 20,
                        child: InkWell(
                          onTap: (){},
                          child: const Image(image: AssetImage('lib/assets/images/greyheart.png')),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                            onTap: (){},
                            child:
                            const Image(image: AssetImage('lib/assets/images/complete-apartment.png'))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                    children: [
                      const SizedBox(width: 35,),
                      const Icon(Icons.star,color:Color(0xffEEA651),)
                      ,const SizedBox(width: 2,),
                      Text("4 (6.8K review)",style: TextStyle(color:kGreyColor,fontFamily: kRegularFont,fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 130,),
                      Container(height: 30,width: 90,decoration: BoxDecoration(color: const Color(0xffF4F6F9),border:
                      Border.all(color: const Color(0xffF4F6F9),),borderRadius:
                      BorderRadius.circular(25)),child: Center(
                        child: Text("Apartment",
                          style: TextStyle(color: kPrimaryColor,fontSize: 12,fontWeight: FontWeight.w600,fontFamily: kRegularFont),),
                      ))
                    ]
                ),

                const SizedBox(height: 5,),
                Row(
                  children: [
                    const SizedBox(width: 25,),
                    Text("Woodland Apartment" , style: TextStyle(color: kDarkBlueColor,fontFamily: kRegularFont,fontWeight: FontWeight.w700
                        ,fontSize: 20),),
                  ],
                ),

                Row(
                  children: [
                    const SizedBox(width: 25,),
                    Text("1012 Ocean avaneu, New york, USA" , style: TextStyle(color: const Color(0xff415770),fontSize: 12,fontFamily:kRegularFont,fontWeight: FontWeight.w500) )
                  ],
                ),



                Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: Get.width * 0.93,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: ListView.separated(

                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 0, bottom: 0),
                            physics: const NeverScrollableScrollPhysics(),
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
                              return const SizedBox(width: 60);
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
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
                  width: Get.width,

                  child: Center(child: controller.listViewItem[controller.selectedIndex])
                )




              ],
            ),
          ),
        );
        }

    );


  }
}
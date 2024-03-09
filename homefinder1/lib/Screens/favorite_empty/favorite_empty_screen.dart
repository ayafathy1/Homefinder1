import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

class FavoriteEmptyScreen extends StatelessWidget {
  const FavoriteEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: CustomArrowBack(),
        leadingWidth: 80,
        title: Text("Favourites",style: TextStyle(
          color: kDarkBlueColor,
          fontSize: 20,
          fontFamily: kRegularFont,
          fontWeight: FontWeight.w900,
        ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: InkWell(child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xffF5F4F8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Image(image: AssetImage("lib/assets/images/Trash.png"),
              ),
            ),
          ),),
        )],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25,left: 15),
            padding: EdgeInsets.only(top: 15,left: 5),
            child: Row(


              children: [
                Text("0 ",style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 18,
                  fontFamily: kRegularFont,
                  fontWeight: FontWeight.w900,
                )),
                Text("estates",style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 18,
                  fontFamily: kRegularFont,
                  fontWeight: FontWeight.w600,
                ))
              ],
            ),
          ),
          Center(child: Container(
            margin: EdgeInsets.only(top: 35),
            height: Get.height*0.3,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 151,width: 163,child: Image(image: AssetImage("lib/assets/images/SuccessIllustration.png"),fit: BoxFit.fill,height: 151,width: 163,)),

                ],
              ),

            ),),),
          Text("Your favorite page is",style: TextStyle(
            color: kDarkBlueColor,
            fontSize: 25,
            fontFamily: kRegularFont,
            fontWeight: FontWeight.w600,
          )),
          Text("empty",style: TextStyle(
            color: kDarkBlueColor,
            fontSize: 25,
            fontFamily: kRegularFont,
            fontWeight: FontWeight.w900,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text("Click add button above to start exploring and",style: TextStyle(
              color: Color(0xff53587A),
              fontSize: 12,
              fontFamily: kRegularFont,
              fontWeight: FontWeight.w500,
            )),
          ),
          Center(
            child: Text("choose your favorite estates.",style: TextStyle(
              color: Color(0xff53587A),
              fontSize: 12,
              fontFamily: kRegularFont,
              fontWeight: FontWeight.w500,
            )),
          ),
        ],
      ),
    );
  }
}

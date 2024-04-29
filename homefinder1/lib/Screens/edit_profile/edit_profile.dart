import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: kDarkBlueColor,
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontFamily: kRegularFont),
        ),
        leading: CustomArrowBack(),
        leadingWidth: 80,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/Profile.png"),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.transparent),
                          color: kPrimaryColor),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Change Profile Picture",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kRegularFont,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child: Text(
              "Profile Info",
              style: TextStyle(
                  color: kVeryDarkBlueColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  fontFamily: kRegularFont),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.14,
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 14),
                              child: Text(
                                "First Name",
                                style: TextStyle(
                                    color: Color(0xff888888),
                                    fontFamily: kRegularFont,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 65,
                              width: 165,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: -20,
                                      blurRadius: 20)
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    filled: true,
                                    fillColor: Color(0xffF2F7FF)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 14),
                              child: Text(
                                "Last Name",
                                style: TextStyle(
                                    color: Color(0xff888888),
                                    fontFamily: kRegularFont,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 65,
                              width: 165,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: -20,
                                      blurRadius: 20)
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    filled: true,
                                    fillColor: Color(0xffF2F7FF)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: Get.width,
                  height: Get.height * 0.13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 3),
                        child: Text(
                          "User Name*",
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontFamily: kRegularFont,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: -20,
                                blurRadius: 20)
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              filled: true,
                              fillColor: Color(0xffF2F7FF)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: Get.width,
                  height: Get.height * 0.13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 3),
                        child: Text(
                          "Phone Number*",
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontFamily: kRegularFont,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: -20,
                                blurRadius: 20)
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              filled: true,
                              fillColor: Color(0xffF2F7FF)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: Get.width,
                  height: Get.height * 0.13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 3),
                        child: Text(
                          "Gender*",
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontFamily: kRegularFont,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: -20,
                                blurRadius: 20)
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              filled: true,
                              fillColor: Color(0xffF2F7FF)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                      width: Get.width*0.8,
                        height: Get.height*0.085,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: CustomElevatedButtonWidget(
                      text: 'Update',
                      onPressed: () {},
                      textStyle: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          fontFamily: kRegularFont),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

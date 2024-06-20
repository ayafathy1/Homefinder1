

// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/edit_listing/controller/edit_listing_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import '../../utilities/constants.dart';
import '../add listing - photos/widget/grid_view.dart';

class EditListingScreen extends StatefulWidget {

  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<EditListingController>(
        init: EditListingController(),
        builder: (EditListingController controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.width * 0.13),
                  Row(
                    children: [
                      CustomArrowBack(),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Text(
                        "Edit Listing",
                        style: TextStyle(
                            fontFamily: kRegularFont,
                            fontWeight: FontWeight.w900,
                            fontSize: 23,
                            color: kDarkBlueColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: Get.width * 0.95,
                    height: Get.height * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 10)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                            width: 105,
                            height: 115,
                            child: Stack(children: [
                              Image(
                                image:
                                    AssetImage("lib/assets/images/Villa.png"),
                                height: 115,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                top: 5,
                                right: 8,
                                child: InkWell(
                                    child: Image(
                                        image: AssetImage(
                                            "lib/assets/images/coloredHeart.png"))),
                              )
                            ])),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffEEA651),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  "4.9",
                                  style: TextStyle(
                                      color: kGreyColor,
                                      fontFamily: kRegularFont,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 148,
                                ),
                                Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF4F6F9),
                                      border: Border.all(
                                        color: Color(0xffF4F6F9),
                                      ),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Text(
                                      "Villa",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: kRegularFont),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Woodland Apartment",
                                  style: TextStyle(
                                      color: kDarkBlueColor,
                                      fontFamily: kRegularFont,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff415770),
                                  size: 17,
                                ),
                                Text(
                                  "1012 Ocean avanue, New yourk, USA",
                                  style: TextStyle(
                                      color: Color(0xff415770),
                                      fontSize: 12,
                                      fontFamily: kRegularFont,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "\$340/month",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      fontFamily: kRegularFont),
                                ),
                                SizedBox(
                                  width: 135,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Listing Title",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.87,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: Get.height * 0.075),
                          filled: true,
                          fillColor: Color(0xffF4F4F4),
                          hintText: "      Schoolview House",
                          hintStyle: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                          suffixIcon: Image(
                              image: AssetImage('lib/assets/images/House.png')),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xffF4F4F4),
                                width: 3,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xff6C63FF),
                                width: 3,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Listing Type",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: kRegularFont,
                            color: kDarkBlueColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor3 == kLightGreyColor &&
                              controller.textColor3 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor3 = Colors.white;
                              controller.contColor3 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor3 = kLightGreyColor;
                              controller.textColor3 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 73,
                          height: 50,
                          decoration: BoxDecoration(
                              color: controller.contColor3,
                              border: Border.all(
                                  color: controller.contColor3, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Rent",
                            style: TextStyle(
                                color: controller.textColor3,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor4 == kLightGreyColor &&
                              controller.textColor4 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor4 = Colors.white;
                              controller.contColor4 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor4 = kLightGreyColor;
                              controller.textColor4 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 93,
                          height: 50,
                          decoration: BoxDecoration(
                              color: controller.contColor4,
                              border: Border.all(
                                  color: controller.contColor4, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Sell",
                            style: TextStyle(
                                color: controller.textColor4,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Property Category",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: kRegularFont,
                            color: kDarkBlueColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.07,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.house == kLightGreyColor &&
                              controller.houseText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.houseText = Colors.white;
                              controller.house = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.house = kLightGreyColor;
                              controller.houseText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.house,
                              border:
                                  Border.all(color: controller.house, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "House",
                            style: TextStyle(
                                color: controller.houseText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.apartment == kLightGreyColor &&
                              controller.apartmentText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.apartmentText = Colors.white;
                              controller.apartment = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.apartment = kLightGreyColor;
                              controller.apartmentText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.apartment,
                              border: Border.all(
                                  color: controller.apartment, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Apartment",
                            style: TextStyle(
                                color: controller.apartmentText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.hotel == kLightGreyColor &&
                              controller.hotelText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.hotelText = Colors.white;
                              controller.hotel = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.hotel = kLightGreyColor;
                              controller.hotelText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.hotel,
                              border:
                                  Border.all(color: controller.hotel, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Hotel",
                            style: TextStyle(
                                color: controller.hotelText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.villa == kLightGreyColor &&
                              controller.villaText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.villaText = Colors.white;
                              controller.villa = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.villa = kLightGreyColor;
                              controller.villaText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.villa,
                              border:
                                  Border.all(color: controller.villa, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Villa",
                            style: TextStyle(
                                color: controller.villaText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.cottege == kLightGreyColor &&
                              controller.cottegeText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.cottegeText = Colors.white;
                              controller.contColor5 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.cottege = kLightGreyColor;
                              controller.cottegeText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.cottege,
                              border: Border.all(
                                  color: controller.cottege, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Cottage",
                            style: TextStyle(
                                color: controller.cottegeText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Listing Photos",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: kRegularFont,
                            color: kDarkBlueColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 450,
                      color: Color(0xffF7F7F7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  mainAxisExtent: 200),
                          itemCount: controller.gridview.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GridView1(
                                gridView: controller.gridview, index: index);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "    sell price",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w600,
                        color: kDarkBlueColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.87,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: Get.height * 0.075),
                          filled: true,
                          fillColor: Color(0xffF4F4F4),
                          hintText: "      \$ 100,000",
                          hintStyle: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                          suffixIcon: Image(
                              image: AssetImage(
                                  'lib/assets/images/dollar sign.png')),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xffF4F4F4),
                                width: 3,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xff6C63FF),
                                width: 3,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "    Rent Price",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: kRegularFont,
                        fontWeight: FontWeight.w600,
                        color: kDarkBlueColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.87,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: Get.height * 0.075),
                          filled: true,
                          fillColor: Color(0xffF4F4F4),
                          hintText: "      \$ 3l5/month",
                          hintStyle: TextStyle(
                              color: kDarkBlueColor,
                              fontFamily: kRegularFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                          suffixIcon: Image(
                              image: AssetImage(
                                  'lib/assets/images/dollar sign.png')),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xffF4F4F4),
                                width: 3,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xff6C63FF),
                                width: 3,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor3 == kLightGreyColor &&
                              controller.textColor3 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor3 = Colors.white;
                              controller.contColor3 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor3 = kLightGreyColor;
                              controller.textColor3 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 73,
                          height: 50,
                          decoration: BoxDecoration(
                              color: controller.contColor3,
                              border: Border.all(
                                  color: controller.contColor3, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Monthly",
                            style: TextStyle(
                                color: controller.textColor3,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor4 == kLightGreyColor &&
                              controller.textColor4 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor4 = Colors.white;
                              controller.contColor4 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor4 = kLightGreyColor;
                              controller.textColor4 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 93,
                          height: 50,
                          decoration: BoxDecoration(
                              color: controller.contColor4,
                              border: Border.all(
                                  color: controller.contColor4, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Yearly",
                            style: TextStyle(
                                color: controller.textColor4,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.045,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("  Property Features",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Bedroom",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 170,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounter1();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${controller.counter1}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounter1();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Bathroom",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounter2();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${controller.counter2}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounter2();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffF4F4F4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "   Balcony",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          InkWell(
                            onTap: () {
                              controller.decrementCounter3();
                            },
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/Delete - Icon.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${controller.counter3}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                controller.incrementCounter3();
                              },
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/Add - Icon.png')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("  Total Rooms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        )),
                  ),
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, mainAxisSpacing: 20),
                          itemCount: controller.gridview1.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                controller.selectedIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: controller.selectedIndex == index
                                        ? kPrimaryColor
                                        : kLightGreyColor,
                                    border: Border.all(
                                        color: Colors.transparent, width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Image(
                                          image: AssetImage(
                                              "${controller.gridview1.elementAt(index)['image']}")),
                                    ),
                                    Center(
                                        child: Text(
                                      "${controller.gridview1.elementAt(index)['number']}",
                                      style: TextStyle(
                                          color:
                                              controller.selectedIndex == index
                                                  ? Colors.white
                                                  : kDarkBlueColor,
                                          fontFamily: kRegularFont,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13),
                                    )),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("  Enviroment/Facilites",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: kRegularFont,
                          color: kDarkBlueColor,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.07,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor1 == kLightGreyColor &&
                              controller.textColor1 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor1 = Colors.white;
                              controller.contColor1 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor1 = kLightGreyColor;
                              controller.textColor1 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.contColor1,
                              border: Border.all(
                                  color: controller.contColor1, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Parking Lot",
                            style: TextStyle(
                                color: controller.textColor1,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor2 == kLightGreyColor &&
                              controller.textColor2 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor2 = Colors.white;
                              controller.contColor2 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor2 = kLightGreyColor;
                              controller.textColor2 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.contColor2,
                              border: Border.all(
                                  color: controller.contColor2, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Pet Allowed",
                            style: TextStyle(
                                color: controller.textColor2,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.garden == kLightGreyColor &&
                              controller.gardenText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.gardenText = Colors.white;
                              controller.garden = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.garden = kLightGreyColor;
                              controller.gardenText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.garden,
                              border: Border.all(
                                  color: controller.garden, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Garden",
                            style: TextStyle(
                                color: controller.gardenText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.gym == kLightGreyColor &&
                              controller.gymText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.gymText = Colors.white;
                              controller.gym = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.gym = kLightGreyColor;
                              controller.gymText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.gym,
                              border:
                                  Border.all(color: controller.gym, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Gym",
                            style: TextStyle(
                                color: controller.gymText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.contColor5 == kLightGreyColor &&
                              controller.textColor5 == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.textColor5 = Colors.white;
                              controller.contColor5 = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.contColor5 = kLightGreyColor;
                              controller.textColor5 = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.contColor5,
                              border: Border.all(
                                  color: controller.contColor5, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Park",
                            style: TextStyle(
                                color: controller.textColor5,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.08,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.homeTheatre == kLightGreyColor &&
                              controller.homeTheatreText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.homeTheatreText = Colors.white;
                              controller.homeTheatre = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.homeTheatre = kLightGreyColor;
                              controller.homeTheatreText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.homeTheatre,
                              border: Border.all(
                                  color: controller.homeTheatre, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Home Theatre",
                            style: TextStyle(
                                color: controller.homeTheatreText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.kidsFriend == kLightGreyColor &&
                              controller.kidsFriendText == kDarkBlueColor) {
                            {}
                            setState(() {
                              controller.kidsFriendText = Colors.white;
                              controller.kidsFriend = kPrimaryColor;
                            });
                          } else {
                            setState(() {
                              controller.kidsFriend = kLightGreyColor;
                              controller.kidsFriendText = kDarkBlueColor;
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: controller.kidsFriend,
                              border: Border.all(
                                  color: controller.kidsFriend, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Kid's friendly",
                            style: TextStyle(
                                color: controller.kidsFriendText,
                                fontFamily: kRegularFont,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.09,
                  ),
                  Center(
                    child: Container(
                      width: 210,
                      height: 64,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border: Border.all(color: kPrimaryColor, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: kRegularFont,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            controller.updateResidance(
                                controller.propertyTitle.text,
                                controller.propertyType,
                                controller.propertyCategory,
                                context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              fixedSize: Size(200, 70))),
                    ),
                  ),
                ],
              ),
            ),
          );
        });

  }
}



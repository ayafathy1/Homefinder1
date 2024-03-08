import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/search_filter/search_filter_controller.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../Widget/custom_arrow_back.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';

class SearchFilter extends StatefulWidget {
  SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
        init: SearchFilterController(),
        builder: (SearchFilterController controller) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 85,
              leading: CustomArrowBack(),
              title: Text(
                "Filter",
                style: TextStyle(
                    color: kDarkBlueColor,
                    fontFamily: kRegularFont,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: controller.sController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: Get.width * 0.85,
                    height: Get.height * 0.06,
                    child: ListView.separated(
                        controller: controller.sController,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 5,
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedIndex = index;
                              setState(() {});
                            },
                            child: Container(
                              width: 103,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex == index
                                      ? controller.activeContainerColor
                                      : controller.deActiveContainerColor,
                                  border: Border.all(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Text(
                                controller.rentOrSale[index],
                                style: TextStyle(
                                    color: controller.selectedIndex == index
                                        ? controller.activeTextColor
                                        : controller.deActiveTextColor,
                                    fontFamily: kRegularFont,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12),
                              )),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Text(
                        "Price Range",
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 15,
                            fontFamily: kRegularFont,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    width: Get.width * 0.98,
                    height: Get.height * 0.04,
                    child: SfRangeSlider(
                      values: controller.values,
                      enableIntervalSelection: true,
                      min: controller.min,
                      max: controller.max,
                      activeColor: kPrimaryColor,
                      inactiveColor: Color(0xffE2EBFF),
                      interval: 500,
                      numberFormat: NumberFormat('\$'),
                      onChanged: (values) {
                        setState(() {
                          controller.values = values;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$100",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                        Text(
                          "\$500",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                        Text(
                          "\$1000",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                        Text(
                          "\$1500",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                        Text(
                          "\$3000",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                        Text(
                          "\$5000",
                          style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kVeryDarkBlueColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                          fontFamily: kRegularFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kVeryDarkBlueColor),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.25,
                    width: Get.width * 0.98,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height * 0.25,
                          width: Get.width * 0.7,
                          child: ListView.separated(
                            padding: EdgeInsets.only(left: 10, top: 8),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: RatingBar.builder(
                                          initialRating: controller.rate[index],
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          ignoreGestures: true,
                                          itemCount: 5,
                                          itemSize: 36,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Color(0xffEEA651),
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                      Text(
                                        "${controller.rate[index].toInt()}",
                                        style: TextStyle(
                                            fontFamily: kRegularFont,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: kVeryDarkBlueColor),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                            itemCount: 4,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 11,
                              );
                            },
                          ),
                        ),
                        Container(
                          height: Get.height * 0.3,
                          width: Get.width * 0.1,
                          child: Column(
                            children: [
                              Radio(
                                activeColor: kVeryDarkBlueColor,
                                value: '5',
                                groupValue: controller.selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    controller.selectedOption = value;
                                  });
                                },
                              ),
                              Radio(
                                activeColor: kVeryDarkBlueColor,
                                value: '4',
                                groupValue: controller.selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    controller.selectedOption = value;
                                  });
                                },
                              ),
                              Radio(
                                activeColor: kVeryDarkBlueColor,
                                value: '3',
                                groupValue: controller.selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    controller.selectedOption = value;
                                  });
                                },
                              ),
                              Radio(
                                activeColor: kVeryDarkBlueColor,
                                value: '2',
                                groupValue: controller.selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    controller.selectedOption = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Bedroom",
                      style: TextStyle(
                          fontFamily: kRegularFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kVeryDarkBlueColor),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.sController,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedIndex1 = index;
                              setState(() {});
                            },
                            child: Container(
                              width: 57,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex1 == index
                                      ? kPrimaryColor
                                      : kLightGreyColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  "${controller.bedRoomNumber[index]}+",
                                  style: TextStyle(
                                      fontFamily: kRegularFont,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: controller.selectedIndex1 == index
                                          ? Colors.white
                                          : kVeryDarkBlueColor),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 7,
                          );
                        },
                        itemCount: 6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Text(
                      "Bathroom",
                      style: TextStyle(
                          fontFamily: kRegularFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kVeryDarkBlueColor),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.065,
                    child: ListView.separated(
                        controller: controller.sController,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedIndex2 = index;
                              setState(() {});
                            },
                            child: Container(
                              width: 57,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex2 == index
                                      ? kPrimaryColor
                                      : kLightGreyColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  "${controller.bathRoomNumber[index]}+",
                                  style: TextStyle(
                                      fontFamily: kRegularFont,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: controller.selectedIndex2 == index
                                          ? Colors.white
                                          : kVeryDarkBlueColor),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 7,
                          );
                        },
                        itemCount: 5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Text(
                      "Location",
                      style: TextStyle(
                          fontFamily: kRegularFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kVeryDarkBlueColor),
                    ),
                  ),
                  Center(
                    child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        margin: EdgeInsets.only(top: 10),
                        width: Get.width * 0.8,
                        height: Get.height * 0.06,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select location",
                              style: TextStyle(
                                  fontFamily: kRegularFont,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: kVeryDarkBlueColor),
                            ),
                            DropdownButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: kVeryDarkBlueColor,
                                  size: 35,
                                ),
                                items: const [],
                                onChanged: (e) {}),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    margin: EdgeInsets.only(top: 25),
                    height: 65,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xfffffbfe),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 20),
                              blurRadius: 50)
                        ],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        controller.max=5000;
                        controller.min=100;
                        controller.selectedIndex=2;
                        controller.selectedIndex1=0;
                        controller.selectedIndex2=0;
                        controller.selectedOption="3";
                        controller.values=SfRangeValues(100, 5000);
                        setState(() {

                        });

                      }, child: Text("Reset Filter",style: TextStyle(fontFamily: kRegularFont,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor),)),

                      Container(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                            onPressed: (){}, child: Center(child: Text("Apply",style: TextStyle(fontFamily: kRegularFont,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),))),
                      )
                    ],),),
                  )
                ],
              ),
            ),
          );
        });
  }
}

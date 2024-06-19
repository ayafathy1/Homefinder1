// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';


class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25),
            height: Get.height * 0.22,
            width: Get.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage("lib/assets/images/reviewHouse.png"),
                    fit: BoxFit.fill)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomArrowBack(),
              ],
            ),
          ),
          const Center(
            child: SizedBox(
              height: 120,
              width: 120,
              child: Image(
                image: AssetImage("lib/assets/images/profileAddReview.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Text(
              "Raj Kumar",
              style: TextStyle(
                  fontFamily: kRegularFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kVeryDarkBlueColor),
            ),
          ),
          SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Center(
                    child: Text(
                      "Agent",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: kRegularFont,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor),
                    ),
                  ),
                ),
                Text(
                  "How was your experience with Raj?",
                  style: TextStyle(
                      fontFamily: kRegularFont,
                      color: kVeryDarkBlueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Divider(),
          ),
          SizedBox(
            height: 60,
            child: Center(
              child: Text(
                "Your overall rating",
                style: TextStyle(
                    color: kGreyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: kRegularFont),
              ),
            ),
          ),
          Center(
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 55,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xffEEA651),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add detailed review",
                  style: TextStyle(
                      color: kVeryDarkBlueColor,
                      fontFamily: kRegularFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: Get.height * 0.15,
            width: Get.width * 0.92,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 0),
                  blurRadius: 5)
            ]),
            child: Center(
                child: TextFormField(
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 100.0, horizontal: 15.0),
                  fillColor: const Color(0xffF4F6F9),
                  filled: true,
                  hintText: "Enter here",
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: TextStyle(
                      color: kGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: kRegularFont),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10))),
            )),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 220,
              height: 60,
              child:ElevatedButton(
             
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              fixedSize: const Size(215,53)
              ,backgroundColor: kPrimaryColor,
              ), child: Text("Submit",style:
              TextStyle(
                  color: Colors.white,
                  fontFamily: kRegularFont,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),),
              ),
            ),
          )
        ],
      )),
    );
  }
}

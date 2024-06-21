import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/profile/controller/profile_controller.dart';
import 'package:homefinder1/Widget/custom_bottom_navigation_bar_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart' as Flutter;
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import '../../utilities/memory.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {




  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (ProfileController controller) {
          return Scaffold(
            bottomNavigationBar: CustomBottomNavigationBarWidget(
              selectedOne:
              "lib/assets/images/homeIconButtonNavigationUnselected.png",
              selectedFourth:
              "lib/assets/images/profileIconBottomNavigation.png",
            ),
            body: controller.isLoading
                ? Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFFe9d9e9),
                rightDotColor: const Color(0xFF8a81d2),
                size: 200,
              ),
            )
                :  SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: Get.height * 0.17,
                      width: Get.width,
                      child: Center(
                        child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                width: 104.67,
                                height: 106.88,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            controller.data?.image?.url??"https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black-thumbnail.png"),
                                        fit: BoxFit.fill)),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(bottom: 5.0, right: 5),
                                child: InkWell(
                                    onTap: () {
                                      controller.pickImage(context);
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(100)),
                                      child: Center(
                                        child: Flutter.Image(
                                          image: AssetImage(
                                              "lib/assets/images/EditProfilePhoto.png"),
                                        ),
                                      ),
                                    )),
                              )
                            ]),
                      ),
                    ),
                    Center(
                      child: Text(
                        controller.data?.fullName??"",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: kRegularFont,
                            fontSize: 15,
                            color: kDarkBlueColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0,bottom: 5),
                      child: Center(
                        child: Text(controller.data?.email??"",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: kRegularFont,
                                fontSize: 13,
                                color: Color(0xff53587A))),
                      ),
                    ),
                    Container(
                        width: Get.width,
                        height: 100,
                        padding: EdgeInsets.only(left: 2, top: 5, right: 2),
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: kLightGreyColor, width: 1),
                                  color: Color(0xfffffbfe),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        offset: Offset(0, 0),
                                        blurRadius: 10)
                                  ]),
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pending",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: kRegularFont,
                                            color: kDarkBlueColor),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "${controller.data1?.pendingCount??0}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: kRegularFont,
                                              color: Color(0xff53587A)),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: kLightGreyColor, width: 1),
                                  color: Color(0xfffffbfe),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        offset: Offset(0, 0),
                                        blurRadius: 10)
                                  ]),
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Approved",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: kRegularFont,
                                            color: kDarkBlueColor),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "${controller.data1?.approvedCount??0}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: kRegularFont,
                                              color: Color(0xff53587A)),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: kLightGreyColor, width: 1),
                                  color: Color(0xfffffbfe),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        offset: Offset(0, 0),
                                        blurRadius: 10)
                                  ]),
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sold",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: kRegularFont,
                                            color: kDarkBlueColor),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "${controller.data1?.soldCount??0}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: kRegularFont,
                                              color: Color(0xff53587A)),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        )),
                    Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: Get.width * 0.93,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Color(0xffF5F4F8),
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
                                      print(controller.selectedIndex);
                                      controller.pendingListingSold();
                                      print(controller.listViewItem.length);
                                      controller.getDataOfApprovedResidences();
                                      controller.getDataOfpendingResidences();
                                      controller.getDataOfSoldResidences();
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 99,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: controller.selectedIndex == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          controller.pOrLOrS[index],
                                          style: TextStyle(
                                              color: controller.selectedIndex == index
                                                  ? kDarkBlueColor
                                                  : Color(0xffA1A5C1),
                                              fontFamily: kRegularFont,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 30);
                                },
                                itemCount: controller.pOrLOrS.length),
                          ),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 20, left: 15.0, bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.selectedIndex==0?" ${controller.pendingResidenceCount}   ":controller.selectedIndex==1?" ${controller.approvedResidenceCount}   ":" ${controller.soldResidenceCount}   ",
                            style: TextStyle(
                                color: kDarkBlueColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                fontFamily: kRegularFont),
                          ),
                          Text(controller.pOrLOrS[controller.selectedIndex],
                              style: TextStyle(
                                  color: kDarkBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  fontFamily: kRegularFont))
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                      width: Get.width,
                      height: Get.height * 0.3,

                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {

                            return controller.listViewItem[controller.selectedIndex];

                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: controller.listViewItem.length),
                    )
                  ],

                      child:controller.listViewItem[controller.selectedIndex]
                    )],

                )),
          );
        });
  }
}

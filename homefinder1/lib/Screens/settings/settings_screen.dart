import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/settings/controller/settings_controller4.dart';
import 'package:homefinder1/Widget/custom_bottom_navigation_bar_widget.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SettingsController>(
        init: SettingsController(),
    builder: (SettingsController controller) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 245,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Container(
                width: 59.5,
                height: 58.88,
                child: Image(
                  image: AssetImage("lib/assets/images/Profile.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ashfak Sayem",
                  style: TextStyle(
                      fontSize: 15,
                      color: kDarkBlueColor,
                      fontWeight: FontWeight.w800,
                      fontFamily: kRegularFont),
                ),
                Text("ashfaksayem@gmail.com",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff535763),
                        fontWeight: FontWeight.w600,
                        fontFamily: kRegularFont))
              ],
            )
          ],
        ),

      ),
      bottomNavigationBar: CustomBottomNavigationBarWidget(selectedOne:
      "lib/assets/images/homeIconButtonNavigationUnselected.png",selectedFifth: "lib/assets/images/SettingsIconButtomNavBar.png",),
      body: Column(
        children: [
          Center(
            child: Container(
              height: Get.height*0.8,
              width: Get.width*0.9,
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10),
                physics: NeverScrollableScrollPhysics()
              ,itemBuilder: (context,index){return
                InkWell(
                  onTap: (){
                    controller.selectedIndex=index;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.selectedIndex==index?kPrimaryColor:Colors.transparent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: Get.width*0.92,
                    height: Get.height*0.075,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color:  controller.selectedIndex==index?Colors.grey.shade300:Colors.transparent,
                                    offset: Offset(0, 0),
                                    blurRadius: 30)
                              ]
                          ),
                          width: 28,
                          height: 28,
                          child: Image(image:
                          AssetImage(controller.selectedIndex==index?controller.photosSelected[index]:controller.photosUnSelected[index]),
                            fit: BoxFit.fill,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(controller.actions[index],style: TextStyle(
                            color:  controller.selectedIndex==index?Colors.white:Color(0xff535763),fontFamily: kRegularFont,
                            fontWeight: FontWeight.w800,fontSize: 17
                        ),),
                      )
                    ],),
                  ),
                );}, separatorBuilder: (context,index){return
              SizedBox(height: 15,);}, itemCount: 7),
            )
          )
        ],
      ),
    );});
  }
}

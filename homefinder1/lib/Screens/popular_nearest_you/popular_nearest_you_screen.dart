import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/widget/box_widget.dart';
import 'package:homefinder1/Screens/popular_nearest_you/controller/popular_nearest_you_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';

import '../../Widget/custom_bottom_navigation_bar_widget.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';

class PopularNearestYou extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PopularNearestYouController>(
        init: PopularNearestYouController(),
    builder: (PopularNearestYouController controller) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.13,
        leading:  CustomArrowBack(),
        leadingWidth: Get.width*0.2,
        title: Text("Popular nearest you " , style: TextStyle(
          color: kDarkBlueColor,
          fontFamily: kRegularFont,
          fontSize: 20,
          fontWeight: FontWeight.w900
        )) ,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
                  hintText: "Search House, Apartment , etc",
                  prefixIcon: Icon(Icons.search_outlined , color: Colors.black,),
                  suffixIcon: InkWell(
                      onTap: (){},
                      child: Image(image: AssetImage('lib/assets/images/options.png'))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xffF4F4F4),
                        width: 3,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xff6C63FF),
                        width: 3,
                      )
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height:Get.height*0.76,
                color: Color(0xffF7F7F7),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding:  EdgeInsets.only(bottom:Get.height*0.07),
                    child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,crossAxisSpacing: 20 , mainAxisSpacing: 20 ,mainAxisExtent: 250 ),
                      itemCount: controller.gridView.length,
                      itemBuilder: (_, int index) {
                        return  Box(gridView:controller.gridView ,index: index,);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBarWidget(),
    );});
  }

}
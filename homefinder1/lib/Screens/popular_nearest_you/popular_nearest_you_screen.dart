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

      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            SizedBox(height: Get.height*0.06,),
            Row(
              children: [
                CustomArrowBack(),
                SizedBox(width: 20,),
                Text("Popular nearest you " , style: TextStyle(color: Colors.black , fontSize: 25, fontWeight: FontWeight.bold),),

              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Container(
                height: Get.height*0.074,
                width: Get.width,
                child: ListView.builder(
                  physics:NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.types.length,
                  itemBuilder: (context, index) {
                    return
                      Row(
                        children: [
                          SizedBox(
                            width:5,
                          ),
                          InkWell(
                            onTap: (){
                              controller.selectedIndex = index;
                                 controller.update();
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                    "${controller.types[index]}",
                                    style: TextStyle(
                                        color: controller.selectedIndex==index?Colors.white:kGreyColor,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: kRegularFont,
                                        fontSize: 13),
                                  )),
                              height: 55,
                              width:92,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex ==index?kPrimaryColor:kLightGreyColor,
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.69),
                                  boxShadow: [
                                    BoxShadow(
                                        color:  controller.selectedIndex==index?Colors.grey:Colors.transparent,
                                        offset: Offset(0, 0),
                                        blurRadius: 20)
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),

                        ],
                      );},
                ),
              ),


            ),


            Center(
              child: Container(
                height: 540,
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
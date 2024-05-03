import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';

class SingleDetailController extends GetxController{
  List<String> type=["Description","Gallery","Review"];
  List<String> pOrLOrS=["Description","Gallery","Review"];
  int selectedIndex=0;
  late List<Widget> listViewItem = [];
  String pendingOrListingOrSold="Description";
  final List houseDetail = [
    {
      "icon":"lib/assets/images/svgviewer-output (7).png",
      "area" : "1.225",
      "title": "sqrt",
    },
    {
      "icon":"lib/assets/images/bedRoom.png",
      "area" : "3.0",
      "title": "Bedrooms",
    },
    {
      "icon":"lib/assets/images/bathtub.png",
      "area" : "1.0",
      "title": "Bathrooms",
    },
    {
      "icon":"lib/assets/images/safety.png",
      "area" : "4,457",
      "title": "Safety Rank",
    }

  ];
  @override
  void onInit() {
    super.onInit();
    descriptionGalleryReview();
  }

  descriptionGalleryReview(){

    if(selectedIndex==0){
      listViewItem = [];
      pendingOrListingOrSold="Description";

      for(var index = 0 ; index<2;index=index+1){
        listViewItem.add(SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: Get.width,
                height: 210,
                padding: EdgeInsets.only(left: 2, top: 10, right: 2),
                margin: EdgeInsets.only(left: 15, top: 15),
                child:ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return Container(
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
                        child:Column(
                          children: [
                           Image(image: AssetImage( " ${houseDetail.elementAt(index)['icon']} ")),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "${houseDetail.elementAt(index)['area']} ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: kRegularFont,
                                    color: Color(0xff53587A)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "${houseDetail.elementAt(index)['title']} ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: kRegularFont,
                                    color: Color(0xff53587A)),
                              ),
                            ),
                          ],
                        ) ,
                      ) ;
                    },

                    separatorBuilder:  (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: houseDetail.length)) ,
            ),
        ));
      }

    }
  
}}
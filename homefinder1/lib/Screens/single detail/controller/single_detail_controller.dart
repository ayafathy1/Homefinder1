
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';

import '../../../models/get_one_residence_model.dart'as o;
import '../../../services/residences_services.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';

class SingleDetailController extends GetxController{
  String? userId;
  BuildContext?context;
  SingleDetailController(this.userId,this.context);
  o.Residence? residence;
  bool isLoading=true;
  ScrollController scroll= ScrollController();
  List<String> type=["Description","Gallery","Review"];
  List<String> pOrLOrS=["Description","Gallery","Review"];
  int selectedIndex=0;
  late List<Widget> listViewItem = [];
  String descriptionOrGalleryOrReview="Description";

  final List <String> homeDetailsTitles=["sqrt","Bedrooms","Bathrooms","Safety Rank"];
  final List <String> homeDeatilsNo=["1.225","1.225","1.0", "4,457"];
  final List <String> homeDeatilsIcons=["lib/assets/images/svgviewer-output (7).png",
    "lib/assets/images/bed1.png",
  "lib/assets/images/bathtub.png",
  "lib/assets/images/safety.png"];
  final List<String> homeFacilitiesIcons=[
    "lib/assets/images/bxs_car-wash.png",
    "lib/assets/images/fontisto_wifi.png",
    "lib/assets/images/map_swimming.png",
    "lib/assets/images/ic_baseline-pets.png",
    "lib/assets/images/Gym.png",
    "lib/assets/images/fa-solid_running.png",
    "lib/assets/images/ion_restaurant.png",
    "lib/assets/images/map_laundry.png"
  ];
  final List<String>homeFacilitiesTitles=[
    "Car Parking",
    "Wi-fi",
    "Swimming pool",
    "Pet Center",
    "Gym & Fit",
    "Sports Club",
    "Restaurant",
    "Laundry"
  ];
  final List<String> homeDetailImages=[
    "lib/assets/images/homeDetails1.png",
    "lib/assets/images/homeDeatail2.png",
    "lib/assets/images/homeDeatail3.png",
    "lib/assets/images/homeDeatail4.png",
    "lib/assets/images/homeDeatail5.png",
    "lib/assets/images/homeDeatail6.png",

  ];

  @override
  void onInit() {
    super.onInit();
    descriptionGalleryReview();
    getDataOfOneResidences(userId!,context!);
  }
  getDataOfOneResidences(String resId,BuildContext context) async {
    try {
      o.GetOneResidencesModel? response = await ResidenceServices.fetchOneResidences( resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        residence = response.residence ;


        // Print or access other properties as needed
        print("Number of residences: ${residence}");
      }

      isLoading = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
    }

  }

  descriptionGalleryReview(){
    if(selectedIndex==0){
      listViewItem = [];
      descriptionOrGalleryOrReview="Description";
      for(var index = 0 ; index<2;index=index+1){
        listViewItem.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25,),
                width: Get.width,
                height: 69.95,
                child:ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return Container(
                        width: 77.5,
                        height: 69.95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xfffffbfe),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(0, 16),
                                  blurRadius: 10)
                            ]),
                        child:Column(
                          children: [
                           Padding(
                             padding: const EdgeInsets.only(top: 6.0),
                             child: Image(image: AssetImage( homeDeatilsIcons[index])),
                           ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                homeDeatilsNo[index],
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: kRegularFont,
                                    color: Color(0xff53587A)),
                              ),
                            ),
                            Text(
                              homeDetailsTitles[index],
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: kRegularFont,
                                  color: Color(0xff53587A)),
                            ),
                          ],
                        ) ,
                      ) ;
                    },
                    separatorBuilder:  (context, index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                    itemCount: homeDetailsTitles.length,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 110,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Listing Agent",
                      style: TextStyle(
                        color: kVeryDarkBlueColor,
                        fontFamily: kRegularFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image(image: AssetImage("lib/assets/images/AgetPhoto.png"),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sandeep S.",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              fontFamily: kRegularFont,
                              color: kVeryDarkBlueColor
                            ),),
                            Text("Partner",
                            style:  TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                fontFamily: kRegularFont,
                                color: Color(0xff8C8C8C)
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(onPressed: (){},
                      icon: Image(image: AssetImage(
                        "lib/assets/images/message.png"
                      ),))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(

                  width: 110,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Facilities",
                      style: TextStyle(
                          color: kVeryDarkBlueColor,
                          fontFamily: kRegularFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(left: 15),
                  width: Get.width,
                  height:150,
                  child:Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                        return Container(

                          width: 120,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xfffffbfe),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: Offset(0, 16),

                                    blurRadius: 10)
                              ]),
                          child:Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,bottom: 10),
                                child: Image(image: AssetImage( homeFacilitiesIcons[index])),
                              ),

                              Container(
                                width:100,
                                child: Center(
                                  child: Text(
                                    homeFacilitiesTitles[index],
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: kRegularFont,
                                        color: Color(0xff6B6B6B)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ) ,
                        ) ;
                      },
                      itemCount: homeFacilitiesIcons.length, gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    crossAxisSpacing: 10,
                      mainAxisSpacing:22
                    ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width:120,
                    child: Center(
                      child: Text("Location",
                      style: TextStyle(
                        fontFamily: kRegularFont,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: kVeryDarkBlueColor
                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Container(
                  height: Get.height*0.29,
                  width: Get.width*0.85,
                  child:Column(
                    children: [
                      Container(
                        height: Get.height*0.22,
                        width: Get.width*0.85,
                        child: Image(
                          image: AssetImage("lib/assets/images/map12.png"),
                          fit: BoxFit.fill,
                          height: Get.height*0.2,
                          width: Get.width*0.85,
                        ),

                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: Get.width*0.85,
                          height: Get.height*0.07,
                          decoration: BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            )
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text(
                                "Select on the map",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: kRegularFont,
                                  color: kVeryDarkBlueColor
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ) ,
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height*0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft:  Radius.circular(20),
                  ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0,-12),
                    blurRadius: 15
                  )
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text("Total Price",
                        style: TextStyle(
                          fontFamily: kRegularFont,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: kVeryDarkBlueColor
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [
                            Text("\$350",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize:17,
                              fontFamily: kRegularFont
                            ),),
                            Text(" /month",
                            style: TextStyle(
                              fontFamily: kRegularFont,
                              fontSize:15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff8C8C8C)
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomElevatedButtonWidget(text: "Book Now",
                      onPressed: (){},
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        fontFamily: kRegularFont
                      ), style: ElevatedButton.styleFrom(
                        fixedSize: Size(165, 46),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ))
                ],
              ),
            )
          ],
        ));
      }

    }
    else if(selectedIndex==1){
      listViewItem = [];
      descriptionOrGalleryOrReview="Gallery";
      for(var index = 0 ; index<2;index=index+1){
         listViewItem.add(Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 10.0,top: 10),
               child: Row(
                 children: [
                   Text("Gallery",
                   style: TextStyle(
                     color: kVeryDarkBlueColor,
                     fontFamily: kRegularFont,
                     fontSize: 14,
                     fontWeight: FontWeight.w700
                   ),),
                   Text(" (400)",
                     style: TextStyle(
                         color: kPrimaryColor,
                         fontFamily: kRegularFont,
                         fontSize: 14,
                         fontWeight: FontWeight.w700
                     ),),
                 ],
               ),
             ),
             Container(
               width: Get.width*0.95,
               height: Get.height*0.8,
               child: GridView.builder(
                 scrollDirection: Axis.vertical,
                 physics: NeverScrollableScrollPhysics(),
                   itemCount: homeDetailImages.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10
               ), itemBuilder:(context,index){
                 return Container(
                   width: 161,
                   height: 155,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.43)
                   ),
                   child: Image(image:
                   AssetImage(homeDetailImages[index])
                     ,fit: BoxFit.fill,
                     width: 161,
                     height: 155,
                   )
                 );
               } ),
             ),
             Container(
               width: Get.width,
               height: Get.height*0.1,
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(20),
                     topLeft:  Radius.circular(20),
                   ),
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.shade300,
                         offset: Offset(0,-12),
                         blurRadius: 15
                     )
                   ]
               ),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 3.0),
                         child: Text("Total Price",
                           style: TextStyle(
                               fontFamily: kRegularFont,
                               fontSize: 22,
                               fontWeight: FontWeight.w700,
                               color: kVeryDarkBlueColor
                           ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 10.0),
                         child: Row(
                           children: [
                             Text("\$350",
                               style: TextStyle(
                                   color: kPrimaryColor,
                                   fontWeight: FontWeight.w600,
                                   fontSize:17,
                                   fontFamily: kRegularFont
                               ),),
                             Text(" /month",
                               style: TextStyle(
                                   fontFamily: kRegularFont,
                                   fontSize:15,
                                   fontWeight: FontWeight.w700,
                                   color: Color(0xff8C8C8C)
                               ),)
                           ],
                         ),
                       )
                     ],
                   ),
                   CustomElevatedButtonWidget(text: "Book Now",
                       onPressed: (){},
                       textStyle: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w700,
                           fontSize: 17,
                           fontFamily: kRegularFont
                       ), style: ElevatedButton.styleFrom(
                           fixedSize: Size(165, 46),
                           backgroundColor: kPrimaryColor,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)
                           )
                       ))
                 ],
               ),
             )

           ],
        ));
      }
    }
    else if(selectedIndex==2){
      listViewItem = [];
      descriptionOrGalleryOrReview="Review";
      for(var index = 0 ; index<=2;index=index+1){
        listViewItem.add(
          Column(

          )
        );
      }
    }

}}
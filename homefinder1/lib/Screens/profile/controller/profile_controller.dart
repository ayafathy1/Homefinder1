import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';


class ProfileController extends GetxController{

  List<String> type=["Listings","Sold","Reviews"];
  List<int> noOfType=[30,12,28];

  List<String> pOrLOrS=["Pending","Listings","Sold"];
  int selectedIndex=0;
  List<String> housesNames=["Wings Tower","Bridgeland Modern House"];
  List<String>housesPhotos=["lib/assets/images/pending1.png","lib/assets/images/pending2.png"];
  int selectedIndex1=0;
  List<int>prices=[370,320];
  List<String>listingHousesNames=["Fairview Apartment","Shoolview House"];
  late List<Widget> listViewItem = [];
  String pendingOrListingOrSold="Pending";
  @override
  void onInit() {
    super.onInit();
    pendingListingSold();
  }
  pendingListingSold(){
    if(selectedIndex==0){
      listViewItem = [];
      pendingOrListingOrSold="Pending";

      for(var index = 0 ; index<2;index=index+1){
        listViewItem.add(InkWell(
          onTap:(){

          } ,
          child: Container(
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5
            ),
            width: 180,
            decoration: BoxDecoration(
                color: Color(0xffF5F4F8),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Container(
                    width: 155,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(
                                housesPhotos[index]),
                            fit: BoxFit.fill)),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap:(){
                                selectedIndex1=index;
                                update();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: 7, right: 7),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(
                                          50)),
                                  child: Center(
                                    child: Icon(
                                      selectedIndex1==index? Icons.favorite:Icons
                                          .favorite_border_outlined,
                                      color:selectedIndex1==index? kPrimaryColor:Color(0xff234F68),
                                      size: 14,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 7, right: 7),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xff1F4C6B)
                                      .withOpacity(0.6),
                                  borderRadius:
                                  BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  "Rent",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: kRegularFont,
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w800),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(

                    child: Text(
                      housesNames[index],
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          fontFamily: kRegularFont),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_filled_outlined,
                        color: Color(0xff8BC83F),
                        size: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Row(
                          children: [
                            Text("November",
                              style: TextStyle(
                                  color: Color(0xff53587A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                  fontFamily: kRegularFont),),
                            Text("21, 2021",
                              style: TextStyle(
                                  color: Color(0xff53587A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                  fontFamily: kRegularFont),),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      }

    }else if(selectedIndex==1){
      listViewItem = [];
      pendingOrListingOrSold="Listing";
      for(var index = 0 ; index<2;index=index+1){listViewItem.add(InkWell(
        onTap:(){

        } ,
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5
          ),
          width: 180,
          decoration: BoxDecoration(
              color: Color(0xffF5F4F8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  width: 155,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(
                              housesPhotos[index]),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap:(){

                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 7, left: 7),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                    BorderRadius.circular(
                                        50)),
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    color:Colors.white,
                                    size: 14,
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap:(){
                              selectedIndex1=index;
                              update();
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 7, right: 7),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(
                                        50)),
                                child: Center(
                                  child: Icon(
                                    selectedIndex1==index? Icons.favorite:Icons
                                        .favorite_border_outlined,
                                    color:selectedIndex1==index? kPrimaryColor:Color(0xff234F68),
                                    size: 14,
                                  ),
                                )),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 7, right: 7),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xff1F4C6B)
                                    .withOpacity(0.6),
                                borderRadius:
                                BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                "\$ ${prices[index]} /month",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: kRegularFont,
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.w800),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(

                  child: Text(
                    listingHousesNames[index],
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: kDarkBlueColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        fontFamily: kRegularFont),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xff234F68).withOpacity(0.9),
                          size: 13,
                        ),
                        Text("4",style: TextStyle(fontFamily: kRegularFont,fontSize: 8,
                            fontWeight: FontWeight.w900,color: Color(0xff53587A)),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_sharp,color: Color(0xff1F4C6B),size:13 ,),
                          Text("Jakarta, Indonesia1",
                            style: TextStyle(
                                color: Color(0xff53587A),
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                fontFamily: kRegularFont),),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ));}

    }else{ listViewItem = [];
    pendingOrListingOrSold="Sold";
    for(var index = 0 ; index<2;index=index+1)
      {listViewItem.add(InkWell(
        onTap:(){

        } ,
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5
          ),
          width: 180,
          decoration: BoxDecoration(
              color: Color(0xffF5F4F8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  width: 155,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(
                              housesPhotos[index]),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap:(){
                              selectedIndex1=index;
                              update();
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 7, right: 7),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(
                                        50)),
                                child: Center(
                                  child: Icon(
                                    Icons
                                        .favorite_border_outlined,
                                    color:selectedIndex1==index? kPrimaryColor:Color(0xff234F68),
                                    size: 14,
                                  ),
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 7, right: 7),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xff1F4C6B)
                                    .withOpacity(0.6),
                                borderRadius:
                                BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                "Rent",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: kRegularFont,
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.w800),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(

                  child: Text(
                    housesNames[index],
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: kDarkBlueColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        fontFamily: kRegularFont),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_filled_outlined,
                      color: Color(0xff8BC83F),
                      size: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Row(
                        children: [
                          Text("November",
                            style: TextStyle(
                                color: Color(0xff53587A),
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                fontFamily: kRegularFont),),
                          Text("21, 2021",
                            style: TextStyle(
                                color: Color(0xff53587A),
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                fontFamily: kRegularFont),),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),

      ));}

    }
    update();
  }
}

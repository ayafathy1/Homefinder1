import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:homefinder1/services/auth_service.dart';
import 'package:homefinder1/utilities/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/get_user_model.dart';
import '../../../models/get_user_model.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';


class ProfileController extends GetxController{


  void onInit() {
    super.onInit();
    getdata();
    pendingListingSold();
  }
  User? data ;
  GetUserModel? data1;
  bool isLoading=true;

  int pendingCount=0;
  int approvedCount=0;
  int soldCount=0;


  List<String> pOrLOrS=["Pending","Approved","Sold"];
  int selectedIndex=0;

  List<String> housesNames=["Wings Tower","Bridgeland Modern House"];
  List<String>housesPhotos=["lib/assets/images/pending1.png","lib/assets/images/pending2.png"];
  int selectedIndex1=0;
  List<int>prices=[370,320];
  List<String>listingHousesNames=["Fairview Apartment","Shoolview House"];
  late List<Widget> listViewItem = [];
  String pendingOrListingOrSold="Pending";

  @override

  getdata() async
  {
      var response = await AuthServices.fetchUserData();

      if (response == null) {
        print("some error occured");
      } else {
        data= response.user;
        data1=response;
        pendingCount=data1?.pendingCount??0;
        approvedCount=data1?.approvedCount??0;
        soldCount=data1?.soldCount??0;

      }

      isLoading = false;

      update();


  }




  pendingListingSold(){
    int counter=data1?.pendingCount??0;
    int counter1=data1?.approvedCount??0;
    int counter2=data1?.soldCount??0;
    if(counter > 0 && selectedIndex == 0){
      listViewItem = [];
      pendingOrListingOrSold="Pending";

      for(var index = 0 ; index<counter;index=index+1){
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

    }else if(counter1 > 0 && selectedIndex == 1){
      listViewItem = [];
      pendingOrListingOrSold="Listing";

      for(var index = 0 ; index<counter1;index=index+1){listViewItem.add(InkWell(
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

    }else if(counter2 > 0 && selectedIndex == 2)
    { listViewItem = [];
    pendingOrListingOrSold="Sold";

    for(var index = 0 ; index<counter2;index=index+1)
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

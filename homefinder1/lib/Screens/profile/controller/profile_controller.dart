import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:homefinder1/Screens/edit_profile/controller/edit_profile_controller.dart';
import 'package:homefinder1/models/get_sold_for_profile_model.dart'as d;
import 'package:homefinder1/services/auth_service.dart';
import 'package:homefinder1/services/residences_services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/get_user_model.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/constants.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utilities/memory.dart';
import '../../settings/controller/settings_controller4.dart';

class ProfileController extends GetxController{
  Uint8List? imageBytes;

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
  ScrollController scrollController=ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController=ScrollController();
    getdata();
    getDataOfSoldResidences();
    getDataOfpendingResidences();
    getDataOfApprovedResidences();
    pendingListingSold();
    scrollController.addListener(loadMoreDataOfSoldResidences);

  }
  @override
  void onReady() {
    super.onReady();
    getdata();
    if(test4){
      Get.delete<ProfileController>();
    }
  }
  bool test4 = Get.isRegistered<ProfileController>();

  Future<void> pickImage(BuildContext context) async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (source != null) {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();


        imageBytes = bytes;
        isLoading=true;

        update();
        // Navigate to UploadPreview page immediately after picking the image
        uploadImage(context, bytes);
      }
    }
  }
  Future<void> uploadImage(BuildContext context, Uint8List imageBytes) async {
    // Convert the image bytes to a file
    final tempDir = await getTemporaryDirectory();
    final file = await new File('${tempDir.path}/image.jpg').create();
    await file.writeAsBytes(imageBytes);

    // Retrieve authorization token
    String? token = await Get.find<StorageService>().getToken;
    if (token == null) {
      print('Authorization token is null.');
      return;
    }

    // Prepare the upload request
    var request = http.MultipartRequest('POST', Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/user/upload-image'));

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers['Authorization'] = token;

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');
        update();
        isLoading=true;
        getdata();
        isLoading=false;
        update();
        bool test4 = Get.isRegistered<EditProfileController>();
        if(test4){
          Get.delete<SettingsController>();
          Get.delete<EditProfileController>();
        }

      } else {
        // If the status code is not success, show the error in CoolAlert
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title:"Error",
          text: response.reasonPhrase,
        );
      }
    } catch (e) {
      // If an exception occurs, show the error in CoolAlert
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: "$e",
      );
      print('Error occurred while uploading image: $e');
    }
  }
  getdata() async
  {
    isLoading=true;
    update();
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

  List<dynamic>? soldResidences ;
  int counterOfSoldResidences=1;
  bool isLoadingMoreDataOfSoldResidences=false;
  int maxNoOfPagesOfSoldResidences=1;
  int soldResidenceCount=0;

  getDataOfSoldResidences() async
  {
    if(
    counterOfSoldResidences==1
    ) {
      var response = await ResidenceServices.fetchUserSoldData(counterOfSoldResidences);

      if (response == null) {
        print("some error occured");
      } else {
        soldResidenceCount=response.count??0;
        soldResidences= response.residences;

      }

      isLoading = false;

      update();

    }else{
      if(counterOfSoldResidences<= (maxNoOfPagesOfSoldResidences??0)){
        var response = await ResidenceServices.fetchUserSoldData(counterOfSoldResidences);
        if(response==null){
          print("some error occured");
        }else{
          soldResidences?.addAll(response!.residences!);
        }
        isLoadingMoreDataOfSoldResidences= false;
        update();
      }



    }
  }

  void loadMoreDataOfSoldResidences(){
    if((scrollController.position.pixels)==(scrollController.position.maxScrollExtent))
    {
      counterOfSoldResidences=counterOfSoldResidences+1;
      isLoadingMoreDataOfSoldResidences= true;
      update();


    }
  }
  List<dynamic>? pendingResidences ;
  int counterOfpendingResidences=1;
  bool isLoadingMoreDataOfpendingResidences=false;
  int maxNoOfPagesOfpendingResidences=1;
int pendingResidenceCount=0;

  getDataOfpendingResidences() async
  {
    if(
    counterOfpendingResidences==1
    ) {
      var response = await ResidenceServices.fetchUserpendingData(counterOfpendingResidences);

      if (response == null) {
        print("some error occured");
      } else {
        pendingResidences= response.residences;
        pendingResidenceCount=response.count??0;

      }

      isLoading = false;

      update();

    }else{
      if(counterOfpendingResidences<= (maxNoOfPagesOfpendingResidences??0)){
        var response = await ResidenceServices.fetchUserpendingData(counterOfpendingResidences);
        if(response==null){
          print("some error occured");
        }else{
          soldResidences?.addAll(response!.residences!);
        }
        isLoadingMoreDataOfpendingResidences= false;
        update();
      }



    }
  }

  void loadMoreDataOfpendingResidences(){
    if((scrollController.position.pixels)==(scrollController.position.maxScrollExtent))
    {
      counterOfpendingResidences=counterOfpendingResidences+1;
      isLoadingMoreDataOfpendingResidences= true;
      update();


    }
  }

  List<dynamic>? approvedResidences ;
  int counterOfApprovedResidences=1;
  bool isLoadingMoreDataOfApprovedResidences=false;
  int maxNoOfPagesOfApprovedResidences=1;
  int approvedResidenceCount=0;

  getDataOfApprovedResidences() async
  {
    if(
    counterOfApprovedResidences==1
    ) {
      var response = await ResidenceServices.fetchUserapprovedData(counterOfApprovedResidences);

      if (response == null) {
        print("some error occured");
      } else {
        approvedResidences= response.residences;
        approvedResidenceCount=response.count??0;

      }

      isLoading = false;

      update();

    }else{
      if(counterOfApprovedResidences<= (maxNoOfPagesOfApprovedResidences??0)){
        var response = await ResidenceServices.fetchUserapprovedData(counterOfApprovedResidences);
        if(response==null){
          print("some error occured");
        }else{
          approvedResidences?.addAll(response!.residences!);
        }
        isLoadingMoreDataOfApprovedResidences= false;
        update();
      }



    }
  }

  void loadMoreDataOfApprovedResidences(){
    if((scrollController.position.pixels)==(scrollController.position.maxScrollExtent))
    {
      counterOfApprovedResidences=counterOfApprovedResidences+1;
      isLoadingMoreDataOfApprovedResidences= true;
      update();


    }
  }

  pendingListingSold(){
    int counter=pendingResidenceCount;
    int counter1=approvedResidenceCount;
    int counter2=soldResidenceCount;
    if(counter > 0 && selectedIndex == 0){
      listViewItem = [];
      for(var index = 0 ; index<counter-1;index=index+1){
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

    }else if(counter==0){
      listViewItem = [];
      for(var index = 0 ; index<counter;index=index+1){ listViewItem.add(SizedBox());}
    }else if(counter1 > 0 && selectedIndex == 1){
      listViewItem = [];

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

    }else if(counter1==0){
      listViewItem = [];
      for(var index = 0 ; index<counter1;index=index+1){listViewItem.add(SizedBox());}
    }
      else if(counter2 > 0 && selectedIndex == 2)
    { listViewItem = [];

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

    }else if(counter2==0){
      listViewItem = [];
      for(var index = 0 ; index<counter2;index=index+1){listViewItem.add(SizedBox());}
    }
    update();

  }
}

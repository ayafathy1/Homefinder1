import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/single%20detail/single_detail.dart';
import 'package:homefinder1/utilities/colors.dart';

import '../../../models/get_all_reesidences_model.dart'as a;
import '../../../models/get_all_reviews_of_residence_model.dart' as c;
import '../../../models/get_one_residence_model.dart'as o;
import '../../../models/get_residence_images_model.dart'as a;
import '../../../models/respose_model.dart';
import '../../../services/residences_services.dart';
import 'package:flutter/material.dart';


class HomeController extends GetxController {
  final BuildContext? context;
  String?resId;
  HomeController( this.context);
  ScrollController scroll = ScrollController();
  bool isLoading = true;
  int counterOfResidences = 1;
  int maxNoOfPagesOfResidences = 1;
  bool isLoadingMoreDataOfResidences = false;
  List<Residence>? residences;
  o.Residence? residence;
  int? ResidenceCount;
  late TextEditingController searchController;

int favSelectedIndex=0;
List<bool>add=[];
int itemCount1=0;
  int itemCount2=0;
  @override
  void onInit() async{
    super.onInit();
    searchController = TextEditingController();
    await getDataOfResidences(context!);


  }
List<a.Image>?images;


  getPhotosOfResidence(String resId,BuildContext context) async {
    try {
      isLoading=true;
      a.GetResidencesImagesModel? response =
      await ResidenceServices.fetchImagesOfResidences(
          resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        images = response.images ?? [];
        print(images);

        // Print or access other properties as needed
        print("Number of residences: ${images?.length}");
      }

      isLoading = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
    }
  }
List<c.Review>?reviews;
  getReviewsOfResidence(String resId,BuildContext context) async {
    try {
      isLoading=true;
      c.GetAllReviewsOfResidenceModel? response =
      await ResidenceServices.fetchReviewsOfResidences(
          resId, context);
      print("API Response Status: ${response?.status}");

      if (response == null) {
        print("Some error occurred: Response is null");
      } else {
        reviews = response.reviews ?? [];

        // Print or access other properties as needed
        print("Number of residences: ${images?.length}");
      }

      isLoading = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
    }
  }
  getDataOfResidences(BuildContext context) async {

    if (counterOfResidences == 1) {
      try {
        GetAllResidencesModel? response = await ResidenceServices.fetchAllResidences(counterOfResidences, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          residences = response.residences ?? [];
          ResidenceCount = response.count ?? 0;
        if(residences==[]){
          itemCount1=0;
          itemCount2=0;
        }else{
          itemCount1=5;
          itemCount2=4;
        }
          // Print or access other properties as needed
          print("Number of residences: ${residences?.length}");
        }

        isLoading = false;
        update();
      } catch (e) {
        print("Exception occurred: $e");
        isLoading = false;
      }
    } else {
      if (counterOfResidences <= (maxNoOfPagesOfResidences ?? 0)) {
        try {
          var response = await ResidenceServices.fetchAllResidences(counterOfResidences, context);
          print("API Response Status: ${response?.status}");

          if (response == null) {
            print("Some error occurred: Response is null");
          } else {
            var newResidences = response.residences ?? [];
            residences?.addAll(newResidences);

            // Print or access other properties as needed
            print("Number of additional residences fetched: ${newResidences.length}");
          }

          isLoadingMoreDataOfResidences = false;
          update();
        } catch (e) {
          print("Exception occurred: $e");
          isLoadingMoreDataOfResidences = false;
        }
      }
    }
  }
  getDataOfOneResidences(String resId,BuildContext context) async {
      try {
        o.GetOneResidencesModel? response = await ResidenceServices.fetchOneResidences( resId, context);
        print("API Response Status: ${response?.status}");

        if (response == null) {
          print("Some error occurred: Response is null");
        } else {
          residence = response.residence ;

         update();
        Get.to(()=>SingleDetailScreen(Id,resId));
          update();

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
  Future<void> addResidenceToFav(String resId,BuildContext context) async {
    try {
      ResponseModel? data = await ResidenceServices.addFavorite(
          resId,
          context
      );
      if (data?.status == "success") {

       print(data?.message);

      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
    }

  }
  Future<void> removeResidenceFromFav(String resId,BuildContext context) async {
    try {
      ResponseModel? data = await ResidenceServices.deleteFavorite(
          resId,
          context
      );
      if (data?.status == "success") {

        print(data?.message);
        getDataOfResidences(context);
        update();

        bool test4 = Get.isRegistered<HomeController>();
        if(test4){
          Get.delete<HomeController>();


        }
      }else{

      }
    } catch (e) {

      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      print(part);
      add.add(false);
    }

  }




}



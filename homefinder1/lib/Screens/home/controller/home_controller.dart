import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/single%20detail/single_detail.dart';
import 'package:homefinder1/utilities/colors.dart';
import '../../../models/get_all_reesidences_model.dart';
import '../../../models/get_one_residence_model.dart'as o;
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
Color color=Colors.grey;
int favSelectedIndex=0;
List<bool>add=[];
  @override
  void onInit() async{
    super.onInit();
    searchController = TextEditingController();
    await getDataOfResidences(context!);
    scroll.addListener(loadMoreDataOfResidences);

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

        Get.to(()=>SingleDetailScreen(resId));
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
        color=kPrimaryColor;
       print(data?.message);
       color=kPrimaryColor;
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
        color=kPrimaryColor;
        print(data?.message);
        color=Colors.grey;
        add.add(true);
        bool test4 = Get.isRegistered<HomeController>();
        if(test4){
          Get.delete<HomeController>();


        }
      }else{
        add.add(false);
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



  void loadMoreDataOfResidences() {
    if (scroll.position.pixels == scroll.position.maxScrollExtent && counterOfResidences < maxNoOfPagesOfResidences) {
      counterOfResidences += 1;
      getDataOfResidences(context!);
    }
  }
}



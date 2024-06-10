import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/residence_model.dart';
import '../../../services/residences_services.dart';

class HomeController extends GetxController{
  ScrollController scroll= new ScrollController();
  List<Residence>? data ;
  bool isLoading = true;
  int counter=1;
  int? maxNoOfPages=1;
  bool isLoadingMoreData=false;
  late int selectedIndex ;
  bool showingSearchTextField=false;
  bool thereIsNoSearchData=false;

}
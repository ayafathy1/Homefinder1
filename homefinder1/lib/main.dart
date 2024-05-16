import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/featured_estates.dart';
import 'package:homefinder1/Screens/SplashScreen/splash_Screen.dart';
import 'package:homefinder1/Screens/add_review/add_review_screen.dart';

import 'Screens/add_listing_1st_detail/add_listing_1st_detail_screen.dart';
import 'Screens/add_listing_fourth_details/add_listing_fourth_details_screen.dart';
import 'Screens/add_listing_second_details/add_listing_second_details_screen.dart';
import 'Screens/change_password/change_password_screen.dart';
import 'Screens/edit_profile/edit_profile.dart';
import 'Screens/home/home_screen.dart';
import 'Screens/profile/profile_screen.dart';
import 'Screens/search_filter/search_filter_screen.dart';
import 'Screens/single detail/single_detail.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
        color: Colors.transparent,
      home: AddListingFourthDetailsScreen()
    );
  }
}




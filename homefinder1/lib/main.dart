import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/featured_estates.dart';
import 'package:homefinder1/Screens/SplashScreen/splash_Screen.dart';


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
      home: FeaturedEstates()
    );
  }
}




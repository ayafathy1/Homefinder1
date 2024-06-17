import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/SplashScreen/splash_Screen.dart';
import 'package:homefinder1/Screens/add_listing_3rd_detail/add_listing_3rd_detail_screen.dart';
import 'package:homefinder1/Screens/add_listing_fourth_details/add_listing_fourth_details_screen.dart';
import 'package:homefinder1/Screens/auth/SignIn/signin.dart';
import 'package:homefinder1/Screens/auth/Signup/signup.dart';
import 'package:homefinder1/utilities/memory.dart';

import 'Screens/Upload Photo/upload_photo.dart';
import 'Screens/add listing - photos/adding_photos.dart';
import 'Screens/add listing - photos/upload_photo.dart';
import 'Screens/add listing - photos/widget/photos.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StorageService.init(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
        color: Colors.transparent,
      home: SignIn(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



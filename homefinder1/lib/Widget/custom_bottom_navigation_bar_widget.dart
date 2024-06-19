import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing/add_listing_screen.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import 'package:homefinder1/Screens/profile/profile_screen.dart';
import 'package:homefinder1/Screens/settings/settings_screen.dart';
class CustomBottomNavigationBarWidget extends StatelessWidget{
  const CustomBottomNavigationBarWidget({super.key, this.selectedOne, this.selectedFourth, this.selectedFifth});
   final String? selectedOne;
   final String? selectedFourth;
  final String? selectedFifth;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
          ,boxShadow: const [BoxShadow(color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 5)]),
      child: BottomNavigationBar(
        onTap: (index){
          if(index==0){
            Get.to(()=>const HomeScreen());
          }else if(index==1){
            Get.to(()=>const AddListing());
          }else if(index==2){
            Get.to(()=>const SettingsScreen());
          }else{
            Get.to(()=>const ProfileScreen());
          }
        },
        backgroundColor: Colors.white10,
        elevation: 0,
        iconSize:35,
        unselectedItemColor: const Color(0xff8694A6),
        selectedItemColor: const Color(0xff6C63FF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(image: AssetImage(selectedOne??'lib/assets/images/bottomHomeIcon.png')),
            backgroundColor: const Color(0x000000ff),
            label: "Home",

          ),
          const BottomNavigationBarItem(
              icon: Image(image: AssetImage('lib/assets/images/Home Add.png'),width: 25,height: 25,fit: BoxFit.fill,),
              backgroundColor: Color(0x000000ff),
              label: "Add listing"
          ),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage(selectedFifth??'lib/assets/images/SettingsIcon.png')),
              backgroundColor: const Color(0x000000ff),
              label: "Settings"
          ),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage(selectedFourth??'lib/assets/images/PersonIcon.png')),
              backgroundColor: const Color(0x000000ff),
              label: "Profile"
          ),
        ],),
    );

  }

}
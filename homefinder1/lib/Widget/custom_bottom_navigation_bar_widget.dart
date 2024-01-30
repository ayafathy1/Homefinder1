import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: Colors.white10,
      elevation: 0,
      iconSize: 30,
      unselectedItemColor: Color(0xff8694A6),
      selectedItemColor: Color(0xff6C63FF),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('lib/assets/images/HomeIcon.png')),
          backgroundColor: Color(0xff),
          label: "Home",

        ),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage('lib/assets/images/LocationIcon.png')),
            backgroundColor: Color(0xff),
            label: "Location"
        ),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage('lib/assets/images/SettingsIcon.png')),
            backgroundColor: Color(0xff),
            label: "Settings"
        ),
        BottomNavigationBarItem(
            icon: Image(image: AssetImage('lib/assets/images/PersonIcon.png')),
            backgroundColor: Color(0xff),
            label: "Profile"
        ),
      ],);
  }

}
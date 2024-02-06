import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomBottomNavigationBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
          ,boxShadow: [BoxShadow(color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 5)]),
      child: BottomNavigationBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        iconSize: 30,
        unselectedItemColor: Color(0xff8694A6),
        selectedItemColor: Color(0xff6C63FF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('lib/assets/images/bottomHomeIcon.png')),
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
        ],),
    );

  }

}
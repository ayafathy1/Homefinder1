import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Featured%20Estates/widget/box_widget.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';

import '../../Widget/custom_bottom_navigation_bar_widget.dart';

class PopularNearestYou extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final List  gridView = [
      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Frame 34221.png"
      },

      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Rectangle 9.png"
      },

      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Frame 34221 (1).png"
      },

      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Rectangle 9 (1).png"
      },

      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Rectangle 9 (2).png"
      },

      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Frame 34221 (1).png"
      },

      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Rectangle 9 (3).png"
      },
      {
        "title" : "Lorem House",
        "price": "\$1500/month",
        "Location" : "Avenue west Side",
        "image" : "lib/assets/images/Rectangle 9 (3).png"
      },

    ];

    return Scaffold(
      appBar: AppBar(title: Text('                      Welcome!',
          style: TextStyle(fontSize: 0, color: Colors.transparent)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Row(
              children: [
                CustomArrowBack(),
                SizedBox(width: 20,),
                Text("Popular Nearest You" , style: TextStyle(color: Colors.black , fontSize: 25, fontWeight: FontWeight.bold),),

              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
                  hintText: "Search House, Apartment , etc",
                  prefixIcon: Icon(Icons.search_outlined , color: Colors.black,),
                  suffixIcon: InkWell(
                      onTap: (){},
                      child: Image(image: AssetImage('lib/assets/images/options.png'))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xffF4F4F4),
                        width: 3,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xff6C63FF),
                        width: 3,
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xff6C63FF)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Text("House" , style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 90,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffF4F4F4)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Apartment" , style: TextStyle(color: Colors.grey),)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 90,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffF4F4F4)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Text("Hotel" , style: TextStyle(color: Colors.grey),)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 90,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffF4F4F4)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Text("Villa" , style: TextStyle(color: Colors.grey),)),
                    ),
                  ),
                ],
              ),

            ),

            SizedBox(height: 12,),
            Center(
              child: Container(
                height: 500,
                color: Color(0xffF7F7F7),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding:  EdgeInsets.only(bottom:Get.height*0.12),
                    child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,crossAxisSpacing: 20 , mainAxisSpacing: 20 ,mainAxisExtent: 250 ),
                      itemCount: gridView.length,
                      itemBuilder: (_, int index) {
                        return  Box(gridView: gridView ,index: index,);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBarWidget(),
    );
  }

}
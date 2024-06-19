// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Box extends StatelessWidget{

  Box( {super.key, Key?Key , required this.gridView , required this.index});

  // ignore: prefer_typing_uninitialized_variables
  var gridView;
  int index;
  @override
  Widget build(BuildContext context){
    return  Container(
      height:Get.height*0.9,
      width: Get.width*0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16) , topRight: Radius.circular(16)),
            child:  Image(image: AssetImage("${gridView.elementAt(index)['image']}" ) ,fit: BoxFit.cover,
              height: 140,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 5,),

            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.only( topRight: Radius.circular(16) ,topLeft: Radius.circular(16) ,bottomRight: Radius.circular(16) ,bottomLeft: Radius.circular(16)),
                child: Container(
                  height: 105,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: Colors.white
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${gridView.elementAt(index)['title']} ", style: const TextStyle(fontWeight: FontWeight.w500 ,fontSize: 20),),
                          const SizedBox(height: 15,),
                          Text(" ${gridView.elementAt(index)['price']}" , style: const TextStyle( fontSize: 12,color: Color(0xff6C63FF)),),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              const Icon(Icons.location_on , color: Color(0xffB9B9B9)),
                              Text("${gridView.elementAt(index)['Location']}" , style: const TextStyle(fontWeight: FontWeight.w300 ,fontSize: 12, color: Color(0xffB9B9B9)),),
                             const SizedBox(width: 18,),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: const Icon(Icons.favorite_border , color: Color(0xff6C63FF),),
                                  ),
                                ),
                              ) ,
                            ],
                          ), ]
                    ),
                  ),
                ),
              ),
            )  ,
        ] ,

      ),

    );
  }

  elementAt(int index) {
    for(int i = 0 ; i >= 0 ; i++){
      index++;


    }
  }
}
import 'package:flutter/material.dart';

class Box extends StatelessWidget{

  Box( {Key?Key , required this.gridView , required this.index});

  var gridView;
  int index;
  @override
  Widget build(BuildContext context){
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          ClipRRect(
            child:  Image(image: AssetImage("${gridView.elementAt(index)['image']}" ) ,fit: BoxFit.cover,
              height: 140,
              width: double.infinity,
            ),

            borderRadius: BorderRadius.only(topLeft: Radius.circular(16) , topRight: Radius.circular(16)),
          ),
          SizedBox(height: 5,),

            Center(
              child: ClipRRect(
                child: Container(
                  height: 100,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${gridView.elementAt(index)['title']} ", style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 20),),
                          SizedBox(height: 15,),
                          Text(" ${gridView.elementAt(index)['price']}" , style: TextStyle( fontSize: 12,color: Color(0xff6C63FF)),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.location_on , color: Color(0xffB9B9B9)),
                              Text("${gridView.elementAt(index)['Location']}" , style: TextStyle(fontWeight: FontWeight.w300 ,fontSize: 12, color: Color(0xffB9B9B9)),),
                             SizedBox(width: 18,),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Icon(Icons.favorite_border , color: Color(0xff6C63FF),),
                                  ),
                                ),
                              ) ,
                            ],
                          ), ]
                    ),
                  ),
                ),
                borderRadius: BorderRadius.only( topRight: Radius.circular(16) ,topLeft: Radius.circular(16) ,bottomRight: Radius.circular(16) ,bottomLeft: Radius.circular(16)),
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
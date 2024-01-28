import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homefinder1/Screens/Set%20Location/set_location.dart';

class UploadPreview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('                      Welcome!',
        style: TextStyle(fontSize: 0, color: Colors.transparent)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 30,),
                Container(
                  color: Color(0xffF4F4F4),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios ,color: Color(0xff6C63FF),) ,),
                ),
              ],
            ),
            Text("Upload Your Photo" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
            Row(
              children: [
                Text("     Profile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
              ],
            ),

            SizedBox(height: 15,),
            Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
            Row(children:[
              Text("      for seccurity" , style: TextStyle(fontSize: 15),)
            ] ),
            SizedBox(height: 50,),
            Image(image: AssetImage('lib/assets/images/User.png')),
            SizedBox(height: 200,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SetLocation()));
              }
                ,
                child: Row(
                  children: [
                    Text("          Next" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    Icon(Icons.navigate_next , size: 30,),
                  ],
                ),
                style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ) ,
                ),
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }

}
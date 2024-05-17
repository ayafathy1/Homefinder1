import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/utilities/colors.dart';

import '../controller/chat_screen_controller.dart';
import 'chatting_cell.dart';
class MessagesList extends StatelessWidget {
   const MessagesList({Key? key, required this.listOfMessages, required this.receiverId}) : super(key: key);
   final List<String>? listOfMessages ;
   final String receiverId;




  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      init: ChatScreenController(receiverId),
      builder: (controller) =>  Expanded(
        child: Container(
          padding:  const EdgeInsets.symmetric(horizontal: 10),
          decoration:    BoxDecoration(
            color: kPrimaryColor,

          ),
          child: ClipRRect(
            borderRadius:  const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child:Padding(
              padding:  const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listOfMessages?.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        ChattingCell(messageText: "listOfMessages?[index].msg??""", sender: "controller.detectWhoWroteTheMessage(listOfMessages?[index].to??0), "==""?true:false,messageTime: "listOfMessages?[index].date??"""),


                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

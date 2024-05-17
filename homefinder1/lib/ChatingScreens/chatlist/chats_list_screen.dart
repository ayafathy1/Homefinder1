// ignore_for_file: prefer_is_empty, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/ChatingScreens/chatlist/widget/loading_chat_list_widget.dart';
import 'package:homefinder1/ChatingScreens/chatlist/widget/user_chat_cell.dart';
import 'package:homefinder1/utilities/colors.dart';
import '../../Widget/no_data_widget.dart';
import 'controller/chat_list_controller.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState(){

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);


    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListController>(
      init: ChatListController(),
      builder: (controller) =>  Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 1.0,
            title: const Text("chat list",style: TextStyle(color: Colors.white),),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: (){
                Get.back();
              },

            ),
        actions: [
          IconButton(icon: const Icon(Icons.search,color: Colors.white,),
            onPressed: (){
              Get.back();
            },

          ),
        ],
        ),

        body:controller.isLoading?const  LoadingChatListWidget(): controller.hasNoData?
        NoDataWidget(refreshedFunc: (){
          controller.getChatList();
        },
        text: "no chat available", imgPath: '', hasRefreshButtonOrNot: true,
        )
            :ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.users?.length,
            itemBuilder: (context, int index) {
             return ChatUserCard(press: () async {
             print("fnsdnfndn");
             }, );
      //        chat: controller.employees?[index]
      }),

    ));
  }
}

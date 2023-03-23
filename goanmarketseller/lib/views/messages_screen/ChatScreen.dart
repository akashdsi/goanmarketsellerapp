import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/const/const.dart';
import '../../const/colors.dart';

import '../widgets/textstyle.dart';
import 'components/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
          actions: [
            10.widthBox,

          ],
          title: boldText(text: "Chats", color: white, size: 16.0),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(itemCount: 12,itemBuilder: ((context,index){
                  return chatbubble();
                }))),
            10.heightBox,
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(

                    decoration: const InputDecoration(
                        isDense:true,
                        hintText: "Enter message",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: purpleColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purpleColor))),
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send, color: purpleColor))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

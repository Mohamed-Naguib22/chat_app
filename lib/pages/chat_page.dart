import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
        {
          List<Message> messageList = [];
          for (var m in snapshot.data!.docs){
            messageList.add(Message.fromjson(m));
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/scholar.png", height: 50,),
                  const Text(
                    "Chat",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CustomChatMessage(message: messageList[index]);
                  }
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    messages.add({
                      'message': data
                    });
                    controller.clear();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        )
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        final data = controller.text;
                        messages.add({
                          'message': data
                        });
                        controller.clear();
                      },
                    ),
                    hintText: "Send Message",
                  ),
                ),
              )
            ],
          )
          );
        }
        return Container();
      }
    );
  }
}

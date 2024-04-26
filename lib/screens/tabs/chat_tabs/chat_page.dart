import 'package:atieed/models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';

class ChatPage extends StatefulWidget {
  bool? ingeneral;

  ChatPage({
    super.key,
    this.ingeneral = false,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [
    Message(
      text: 'Hello!',
      senderName: 'John Doe',
      time: '10:00 AM',
      isSentByMe: false,
    ),
    Message(
      text: 'Hi there!',
      senderName: 'Jane Smith',
      time: '10:05 AM',
      isSentByMe: true,
    ),
    Message(
      text: 'How are you?',
      senderName: 'John Doe',
      time: '10:10 AM',
      isSentByMe: false,
    ),
    Message(
      text: 'I\'m good, thanks!',
      senderName: 'Jane Smith',
      time: '10:15 AM',
      isSentByMe: true,
    ),
    Message(
      text: 'What about you?',
      senderName: 'John Doe',
      time: '10:20 AM',
      isSentByMe: false,
    ),
    Message(
      text: 'I\'m doing well.',
      senderName: 'Jane Smith',
      time: '10:25 AM',
      isSentByMe: true,
    ),
  ];
  final msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 75,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      minRadius: 27,
                      maxRadius: 27,
                      backgroundColor: grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'John Doe',
                          fontSize: 18,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextWidget(
                              text: 'Online',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: grey,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageWidget(message: messages[index]);
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 275,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: 'Regular',
                        fontSize: 14,
                        color: primary,
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        filled: true,
                        fillColor: grey,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                        hintStyle: const TextStyle(
                          fontFamily: 'Regular',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        hintText: 'Write something...',
                        border: InputBorder.none,
                      ),
                      controller: msg,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.send,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!message.isSentByMe)
            CircleAvatar(
              child: Text(message.senderName[0]),
            ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: message.isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  message.senderName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Bold'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: message.isSentByMe ? Colors.blue : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    message.text,
                    style: TextStyle(
                        color: message.isSentByMe ? Colors.white : Colors.black,
                        fontFamily: 'Regular'),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey, fontFamily: 'Regular'),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          if (message.isSentByMe)
            CircleAvatar(
              child: Text(
                message.senderName[0],
                style: const TextStyle(fontFamily: 'Bold'),
              ),
            ),
        ],
      ),
    );
  }
}

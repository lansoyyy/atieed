import 'package:flutter/material.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';

class ChatInfoPage extends StatelessWidget {
  const ChatInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                minRadius: 50,
                maxRadius: 50,
                backgroundColor: grey,
                child: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: TextWidget(
                text: 'ENGLISH 101',
                fontSize: 24,
                fontFamily: 'Bold',
                color: primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextWidget(
                maxLines: 5,
                text:
                    'Fundamentals of English language for Science Technology and Engineering Students',
                fontSize: 14,
                fontFamily: 'Medium',
                color: primary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: primary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Group Name',
                    fontSize: 12,
                    color: grey,
                  ),
                  TextWidget(
                    text: 'ENGLISH 101',
                    fontSize: 18,
                    color: primary,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'Adviser',
                    fontSize: 12,
                    color: grey,
                  ),
                  TextWidget(
                    text: 'Mr. John Doe',
                    fontSize: 18,
                    color: primary,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'Members',
                    fontSize: 12,
                    color: grey,
                  ),
                  TextWidget(
                    text: 'Students',
                    fontSize: 18,
                    color: primary,
                    fontFamily: 'Bold',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

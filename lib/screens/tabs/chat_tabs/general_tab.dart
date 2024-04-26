import 'package:atieed/screens/tabs/chat_tabs/chat_page.dart';
import 'package:atieed/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/widgets.dart';

class GeneralTab extends StatelessWidget {
  const GeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                TextWidget(
                  text: 'Inbox',
                  fontSize: 24,
                  fontFamily: 'Bold',
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  child: const CircleAvatar(
                    minRadius: 15,
                    maxRadius: 15,
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            minRadius: 27,
                            maxRadius: 27,
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: 'JOBERT',
                                fontSize: 18,
                                fontFamily: 'Bold',
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 175,
                                child: TextWidget(
                                  text: 'Jobert: Naay Klase Karon?',
                                  fontSize: 14,
                                  fontFamily: 'Regular',
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(
                              width: 20,
                            ),
                          ),
                          TextWidget(
                            text: '10:00 AM',
                            fontSize: 12,
                            fontFamily: 'Regular',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

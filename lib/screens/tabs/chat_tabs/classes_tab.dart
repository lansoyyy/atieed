import 'package:flutter/material.dart';

import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';

class ClassesTab extends StatelessWidget {
  const ClassesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: secondary,
                    thickness: 3,
                    width: 3,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  minRadius: 27,
                  maxRadius: 27,
                  backgroundColor: grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'MATH 101',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                    SizedBox(
                      width: 175,
                      child: TextWidget(
                        text: 'Jobert: Naay Klase Karon?',
                        fontSize: 14,
                        fontFamily: 'Regular',
                        color: grey,
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
                  color: grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    TextWidget(
                      text: 'Help',
                      fontSize: 32,
                      fontFamily: 'Bold',
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                tile(
                  'How to use the app',
                  () {},
                ),
                tile(
                  'Privacy Policy and Terms & Conditions',
                  () {},
                ),
                tile(
                  "There's an issue when using the app",
                  () {},
                ),
                tile(
                  "Sync courses",
                  () {},
                ),
                tile(
                  "From Student to Teacher role",
                  () {},
                ),
                tile(
                  "From Teacher to Student role",
                  () {},
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tile(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
          child: SizedBox(
            height: 50,
            width: 500,
            child: ListTile(
              leading: TextWidget(
                text: label,
                fontSize: 16,
                fontFamily: 'Bold',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

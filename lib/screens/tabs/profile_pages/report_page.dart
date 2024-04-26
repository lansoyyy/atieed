import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final subject = TextEditingController();
  final issue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      text: 'Report an Issue',
                      fontSize: 32,
                      fontFamily: 'Bold',
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextWidget(
                  text: 'John Doe',
                  fontSize: 28,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: 'Student',
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Medium',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  width: 350,
                  controller: subject,
                  label: 'Subject',
                ),
                TextFieldWidget(
                  radius: 15,
                  width: 350,
                  height: 200,
                  maxLine: 8,
                  controller: subject,
                  label: 'Report an Issue',
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  label: 'Send',
                  onPressed: () {},
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

  Widget tile(IconData icon, String label, VoidCallback onTap) {
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
              15,
            ),
          ),
          child: ListTile(
            leading: TextWidget(
              text: label,
              fontSize: 18,
              fontFamily: 'Bold',
            ),
            trailing: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}

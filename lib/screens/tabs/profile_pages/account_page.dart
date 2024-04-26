import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final bdate = TextEditingController();
  final gradelevel = TextEditingController();
  final studentnumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
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
                      text: 'Account',
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
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const CircleAvatar(
                    minRadius: 50,
                    maxRadius: 50,
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: 'John Doe',
                  fontSize: 22,
                  fontFamily: 'Bold',
                ),
                TextWidget(
                  text: '12STEMA2',
                  fontSize: 11,
                  fontFamily: 'Regular',
                ),
                const SizedBox(
                  height: 10,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 175,
                      child: TextFieldWidget(
                        controller: bdate,
                        label: 'Birthdate',
                      ),
                    ),
                    SizedBox(
                      width: 175,
                      child: TextFieldWidget(
                        controller: gradelevel,
                        label: 'Grade Level',
                      ),
                    ),
                  ],
                ),
                TextFieldWidget(
                  width: 350,
                  controller: studentnumber,
                  label: 'Student Number',
                ),
                TextFieldWidget(
                  width: 350,
                  controller: email,
                  label: 'Email',
                ),
                TextFieldWidget(
                  width: 350,
                  controller: password,
                  label: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  label: 'Save',
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
}

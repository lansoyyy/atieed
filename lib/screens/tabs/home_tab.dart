import 'package:atieed/screens/notif_screen.dart';
import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: 'Surname, Firstname',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NotifScreen()));
                    },
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
              Row(
                children: [
                  TextWidget(
                    text: 'Grade Level',
                    fontSize: 12,
                    fontFamily: 'Medum',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextWidget(
                    text: 'Section',
                    fontSize: 12,
                    fontFamily: 'Medum',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: grey, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Subject',
                        fontSize: 16,
                        fontFamily: 'Bold',
                      ),
                      Row(
                        children: [
                          TextWidget(
                            text: 'Semester',
                            fontSize: 11,
                            fontFamily: 'Medum',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: 'Section',
                            fontSize: 11,
                            fontFamily: 'Medum',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green[200]!,
                              Colors.green[400]!,
                              Colors.green[600]!,
                              Colors.green[800]!
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: 'Total',
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontFamily: 'Bold',
                                  ),
                                  Container(
                                    width: 115,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    child: Center(
                                      child: TextWidget(
                                        text: 'November',
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'Medium',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextWidget(
                                text: 'Attendance',
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: 30,
                                ),
                              ),
                              TextWidget(
                                text: '0%',
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
                              Container(
                                width: double.infinity,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Present',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Bold',
                                  ),
                                  Center(
                                    child: TextWidget(
                                      text: '90',
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontFamily: 'Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Absent',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Bold',
                                  ),
                                  Center(
                                    child: TextWidget(
                                      text: '90',
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontFamily: 'Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Late',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Bold',
                                  ),
                                  Center(
                                    child: TextWidget(
                                      text: '0',
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontFamily: 'Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Excuse',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Bold',
                                  ),
                                  Center(
                                    child: TextWidget(
                                      text: '0',
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontFamily: 'Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonWidget(
                  label: 'Check Attendance',
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'History',
                      fontSize: 22,
                      fontFamily: 'Bold',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'Attendance',
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'November',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: '1st Semester',
                            fontSize: 12,
                          ),
                          TextWidget(
                            align: TextAlign.start,
                            maxLines: 2,
                            text:
                                'Contemporary Philippine Arts from the Regions',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: 'November',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: '6:00 - 7:00',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                              Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: '12STEMA2',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Tue',
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Wed',
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: 'Thu',
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: 'Medium',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

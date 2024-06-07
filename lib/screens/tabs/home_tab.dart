import 'package:atieed/screens/notif_screen.dart';
import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/app_constants.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/header_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Records')
            .where('students', arrayContains: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final recordsData = snapshot.requireData;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const HeaderWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Courses')
                            .where('students', arrayContains: userId)
                            .orderBy('dateTime', descending: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final courseData = snapshot.requireData;
                          return courseData.docs.first['hasStarted'] == true
                              ? Container(
                                  width: double.infinity,
                                  height: 375,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: grey, width: 3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: courseData.docs.first['name'],
                                          fontSize: 16,
                                          fontFamily: 'Bold',
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(
                                              text: courseData
                                                  .docs.first['semester'],
                                              fontSize: 11,
                                              fontFamily: 'Medum',
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextWidget(
                                              text: courseData
                                                  .docs.first['section'],
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
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextWidget(
                                                      text: 'Class',
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text: DateFormat.MMM()
                                                              .format(DateTime
                                                                  .now()),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                color: green,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: 'Present',
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontFamily: 'Bold',
                                                    ),
                                                    Center(
                                                      child: TextWidget(
                                                        text: courseData
                                                            .docs
                                                            .first['presents']
                                                            .length
                                                            .toString(),
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: 'Absent',
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontFamily: 'Bold',
                                                    ),
                                                    Center(
                                                      child: TextWidget(
                                                        text: (courseData
                                                                    .docs
                                                                    .first[
                                                                        'students']
                                                                    .length -
                                                                courseData
                                                                    .docs
                                                                    .first[
                                                                        'presents']
                                                                    .length)
                                                            .toString(),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[600],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                )
                              : Center(
                                  child: TextWidget(
                                    text: 'No Class Started',
                                    fontSize: 48,
                                    fontFamily: 'Bold',
                                    color: Colors.grey,
                                  ),
                                );
                        }),
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    recordsData.docs.isEmpty
                        ? Center(
                            child: TextWidget(
                              text:
                                  'Not been added by your teacher or professor yet.',
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Medium',
                            ),
                          )
                        : Column(
                            children: [
                              for (int i = 0; i < recordsData.docs.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 225,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 115,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: green,
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    20,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: TextWidget(
                                                    text: DateFormat.MMM()
                                                        .format(DateTime.now()),
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
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextWidget(
                                            text: recordsData.docs[i]
                                                ['semester'],
                                            fontSize: 12,
                                          ),
                                          TextWidget(
                                            align: TextAlign.start,
                                            maxLines: 2,
                                            text: recordsData.docs[i]['name'],
                                            fontSize: 18,
                                            fontFamily: 'Bold',
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 125,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: TextWidget(
                                                    text:
                                                        '${recordsData.docs[i]['timefrom']} - ${recordsData.docs[i]['timeto']}',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'Medium',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 125,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: TextWidget(
                                                    text: recordsData.docs[i]
                                                        ['section'],
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
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                for (int j = 0;
                                                    j <
                                                        recordsData
                                                            .docs[i]['days']
                                                            .length;
                                                    j++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: Container(
                                                      width: 100,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: green,
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text: recordsData
                                                                  .docs[i]
                                                              ['days'][j],
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontFamily: 'Medium',
                                                        ),
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
                  ],
                ),
              ),
            ),
          );
        });
  }
}

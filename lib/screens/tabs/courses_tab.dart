import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/app_constants.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CourseTab extends StatefulWidget {
  const CourseTab({super.key});

  @override
  State<CourseTab> createState() => _CourseTabState();
}

class _CourseTabState extends State<CourseTab> {
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isclicked ? courseWidget() : mainWidget()),
    );
  }

  String sem = '1st Semester';

  dynamic courseData = {};

  Widget mainWidget() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Courses')
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

          final data = snapshot.requireData;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextWidget(
                      text: 'Courses',
                      fontSize: 24,
                      fontFamily: 'Bold',
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.notifications_none_rounded,
                    //   ),
                    // ),
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
                        child: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'Upcoming Courses',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
                data.docs.isEmpty
                    ? Center(
                        child: TextWidget(
                          text: 'No Upcoming Course',
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Medium',
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < data.docs.length; i++)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: i == 0 ? 0 : 10, right: 10),
                                child: Container(
                                  width: 275,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: secondary),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 125,
                                        child: TextWidget(
                                          align: TextAlign.start,
                                          maxLines: 5,
                                          text: data.docs[i]['name'],
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text: data.docs[i]['days'][0],
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontFamily: 'Medium',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: sem,
                        fontSize: 22,
                        fontFamily: 'Bold',
                      ),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                setState(() {
                                  sem = '1st Semester';
                                });
                              },
                              child: TextWidget(
                                text: '1st Semester',
                                fontSize: 18,
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                setState(() {
                                  sem = '2nd Semester';
                                });
                              },
                              child: TextWidget(
                                text: '2nd Semester',
                                fontSize: 18,
                              ),
                            ),
                          ];
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    for (int i = 0; i < data.docs.length; i++)
                      data.docs[i]['semester'] == sem
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    courseData = data.docs[i];
                                    isclicked = true;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 175,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Expanded(
                                              child: SizedBox(
                                                width: 20,
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: primary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                              ),
                                              child: Center(
                                                child: TextWidget(
                                                  text: 'In Progress',
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontFamily: 'Medium',
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.info,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextWidget(
                                          text: data.docs[i]['semester'],
                                          fontSize: 12,
                                        ),
                                        TextWidget(
                                          align: TextAlign.start,
                                          maxLines: 2,
                                          text: data.docs[i]['name'],
                                          fontSize: 18,
                                          fontFamily: 'Bold',
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              text: data.docs[i]['section'],
                                              fontSize: 12,
                                            ),
                                            TextWidget(
                                              text:
                                                  'First Semester SY 2023-2024 (SHS)',
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Center(
                                child: TextWidget(
                                  text:
                                      'Not been added by your teacher or professor yet.',
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'Medium',
                                ),
                              ),
                            ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget courseWidget() {
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
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isclicked = false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    TextWidget(
                      text: 'Courses',
                      fontSize: 24,
                      fontFamily: 'Bold',
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.notifications_none_rounded,
                    //   ),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      minRadius: 15,
                      maxRadius: 15,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Teachers')
                        .doc(courseData['uid'])
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: Text('Loading'));
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      dynamic teachetData = snapshot.data;
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              minRadius: 35,
                              maxRadius: 35,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(teachetData['img']),
                            ),
                            TextWidget(
                              text: teachetData['name'],
                              fontSize: 12,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextWidget(
                              text: courseData['semester'],
                              fontSize: 18,
                              fontFamily: 'Medium',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              maxLines: 2,
                              text: courseData['name'],
                              fontSize: 28,
                              fontFamily: 'Bold',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Wrap(
                                children: [
                                  for (int i = 0;
                                      i < courseData['days'].length;
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Container(
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text: courseData['days'][i],
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: 'Medium',
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 125,
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
                                      text:
                                          '${courseData['timefrom']} - ${courseData['timeto']}',
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
                                      text: '${courseData['section']}',
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
                            Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: 'In Progress',
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'Medium',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: 'History',
                                    fontSize: 22,
                                    fontFamily: 'Bold',
                                  ),
                                ],
                              ),
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
                                      for (int i = 0;
                                          i < recordsData.docs.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Container(
                                            width: double.infinity,
                                            height: 225,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            20,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: 'Attendance',
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Medium',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        width: 115,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            20,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: DateFormat
                                                                    .MMM()
                                                                .format(DateTime
                                                                    .now()),
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Medium',
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
                                                    text: recordsData.docs[i]
                                                        ['name'],
                                                    fontSize: 18,
                                                    fontFamily: 'Bold',
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        width: 125,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text:
                                                                '${recordsData.docs[i]['timefrom']} - ${recordsData.docs[i]['timeto']}',
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Medium',
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 125,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: recordsData
                                                                    .docs[i]
                                                                ['section'],
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Medium',
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
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        for (int j = 0;
                                                            j <
                                                                recordsData
                                                                    .docs[i]
                                                                        ['days']
                                                                    .length;
                                                            j++)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Container(
                                                              width: 100,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: green,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  20,
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    TextWidget(
                                                                  text: recordsData
                                                                          .docs[i]
                                                                      [
                                                                      'days'][j],
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Medium',
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
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          );
        });
  }
}

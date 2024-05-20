import 'package:atieed/screens/tabs/chat_tabs/chat_page.dart';
import 'package:atieed/screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class GeneralTab extends StatelessWidget {
  const GeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Students')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    return SizedBox(
                      height: 500,
                      width: 500,
                      child: ListView.separated(
                        itemCount: data.docs.length,
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                        driverId: data.docs[index].id,
                                        driverName: data.docs[index]['name'])));
                              },
                              leading: SizedBox(
                                width: 300,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(data.docs[index]['img']),
                                      minRadius: 25,
                                      maxRadius: 25,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: data.docs[index]['name'],
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                    ),
                                  ],
                                ),
                              ),
                              trailing: TextWidget(
                                text: 'Student',
                                fontSize: 13,
                                fontFamily: 'Bold',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  });
            },
          );
        },
      ),
      body: SafeArea(
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
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Messages')
                      .where('userId',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .orderBy('dateTime')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('error');
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
                    return Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                            itemCount: data.docs.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ListTile(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Messages')
                                          .doc(data.docs[index].id)
                                          .update({'seen': true});
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => ChatPage(
                                                    driverId: data.docs[index]
                                                        ['driverId'],
                                                    driverName: data.docs[index]
                                                        ['driverName'],
                                                  )));
                                    },
                                    leading: CircleAvatar(
                                      maxRadius: 25,
                                      minRadius: 25,
                                      backgroundImage: NetworkImage(
                                        data.docs[index]['driverProfile'],
                                      ),
                                    ),
                                    title: data.docs[index]['seen'] == true
                                        ? TextWidget(
                                            text: data.docs[index]
                                                ['driverName'],
                                            fontSize: 15,
                                            color: Colors.black)
                                        : TextWidget(
                                            text: data.docs[index]
                                                ['driverName'],
                                            fontSize: 15,
                                            color: Colors.black),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        data.docs[index]['seen'] == true
                                            ? Text(
                                                data.docs[index]['lastMessage']
                                                            .toString()
                                                            .length >
                                                        21
                                                    ? '${data.docs[index]['lastMessage'].toString().substring(0, 21)}...'
                                                    : data.docs[index]
                                                        ['lastMessage'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'QRegular'),
                                              )
                                            : Text(
                                                data.docs[index]['lastMessage']
                                                            .toString()
                                                            .length >
                                                        21
                                                    ? '${data.docs[index]['lastMessage'].toString().substring(0, 21)}...'
                                                    : data.docs[index]
                                                        ['lastMessage'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'QBold'),
                                              ),
                                        data.docs[index]['seen'] == true
                                            ? TextWidget(
                                                text: DateFormat.jm().format(
                                                    data.docs[index]['dateTime']
                                                        .toDate()),
                                                fontSize: 12,
                                                color: Colors.black,
                                              )
                                            : TextWidget(
                                                text: DateFormat.jm().format(
                                                    data.docs[index]['dateTime']
                                                        .toDate()),
                                                fontSize: 12,
                                                color: Colors.black),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: const Text(
                                                    'Delete Confirmation',
                                                    style: TextStyle(
                                                        fontFamily: 'QBold',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  content: const Text(
                                                    'Are you sure you want to delete this conversation?',
                                                    style: TextStyle(
                                                        fontFamily: 'QRegular'),
                                                  ),
                                                  actions: <Widget>[
                                                    MaterialButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(true),
                                                      child: const Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'QRegular',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'Messages')
                                                            .doc(data
                                                                .docs[index].id)
                                                            .delete();
                                                      },
                                                      child: const Text(
                                                        'Continue',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'QRegular',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ));
                            })),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

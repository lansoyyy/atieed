import 'package:atieed/screens/notif_screen.dart';
import 'package:atieed/screens/profile_screen.dart';
import 'package:atieed/utlis/app_constants.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Students')
        .doc(userId)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading'));
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          dynamic data = snapshot.data;
          return Row(
            children: [
              TextWidget(
                text: data['name'],
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
                child: CircleAvatar(
                  minRadius: 15,
                  maxRadius: 15,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(data['img']),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          );
        });
  }
}

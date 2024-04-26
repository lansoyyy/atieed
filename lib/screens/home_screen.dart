import 'package:atieed/screens/tabs/attendance_tab.dart';
import 'package:atieed/screens/tabs/chat_tabs/general_tab.dart';
import 'package:atieed/screens/tabs/courses_tab.dart';
import 'package:atieed/screens/tabs/home_tab.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  List tabs = [
    const HomeTab(),
    const CourseTab(),
    const AttendanceTab(),
    const GeneralTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: primary,
        backgroundColor: grey,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontFamily: 'Bold'),
            ),
            selectedColor: primary,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.school_outlined),
            title: const Text(
              "Course",
              style: TextStyle(fontFamily: 'Bold'),
            ),
            selectedColor: primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.groups),
            title: const Text(
              "Attendance",
              style: TextStyle(fontFamily: 'Bold'),
            ),
            selectedColor: primary,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.inbox),
            title: const Text(
              "Inbox",
              style: TextStyle(fontFamily: 'Bold'),
            ),
            selectedColor: primary,
          ),

          /// Profile
        ],
      ),
    );
  }
}

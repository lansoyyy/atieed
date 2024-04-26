import 'package:atieed/screens/auth/auth_screen.dart';
import 'package:atieed/screens/profile_pages/account_page.dart';
import 'package:atieed/screens/profile_pages/help_page.dart';
import 'package:atieed/screens/profile_pages/report_page.dart';
import 'package:atieed/screens/profile_pages/settings_page.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                tile(
                  Icons.settings,
                  'Settings',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
                  },
                ),
                tile(
                  Icons.person,
                  'Account',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AccountPage()));
                  },
                ),
                tile(
                  Icons.help,
                  'Help',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelpPage()));
                  },
                ),
                tile(
                  Icons.warning,
                  'Report an Issue',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ReportPage()));
                  },
                ),
                tile(
                  Icons.logout,
                  'Logout',
                  () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
                  },
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

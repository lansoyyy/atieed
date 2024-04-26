import 'package:atieed/screens/home_screen.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CheckedPage extends StatelessWidget {
  const CheckedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              maxLines: 2,
              text: 'Attendance\nChecked',
              fontSize: 32,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: primary, width: 2),
              ),
              child: Center(
                child: TextWidget(
                  maxLines: 2,
                  text: 'Contemporary Philippine Arts from the Regions',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 35,
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
                      text: 'November 26, 2030',
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Medium',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 75,
                  height: 35,
                  decoration: BoxDecoration(
                    color: green,
                    border: Border.all(
                      color: Colors.black,
                    ),
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
            const SizedBox(
              height: 20,
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
            TextWidget(
              maxLines: 2,
              text: 'Attended at:',
              fontSize: 18,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 35,
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
                      text: 'November 26, 2030',
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Medium',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 35,
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
                      text: '6:00 AM',
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Medium',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ButtonWidget(
                radius: 100,
                width: 175,
                label: 'Go Back',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

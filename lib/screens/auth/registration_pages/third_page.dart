import 'package:atieed/screens/auth/auth_screen.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final ins = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 5,
                    color: primary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextWidget(
                maxLines: 10,
                text:
                    'Verification email has been sent to your email address. Please check your inbox and follow the instructions to complete the verification process.',
                fontSize: 22,
                fontFamily: 'Bold',
                color: primary,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ButtonWidget(
                fontSize: 18,
                width: 150,
                label: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AuthScreen()));
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:atieed/screens/home_screen.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Login',
              fontSize: 18,
            ),
            TextWidget(
              text: 'Hey there! Welcome back.',
              fontSize: 12,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              width: double.infinity,
              controller: email,
              label: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              width: double.infinity,
              controller: password,
              label: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget(
                fontSize: 14,
                width: 150,
                label: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: TextWidget(
                text: 'or',
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/googlelogo.png',
                  height: 35,
                ),
                Image.asset(
                  'assets/images/fblogo.png',
                  height: 35,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

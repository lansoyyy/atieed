import 'package:atieed/screens/home_screen.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:atieed/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              isObscure: true,
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
                  login(context);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  login(context) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      if (user.user!.emailVerified) {
        showToast('Logged in succesfully!');

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        showToast('Email not verified!');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}

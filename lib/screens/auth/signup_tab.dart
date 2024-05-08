import 'package:atieed/screens/auth/registration_pages/first_page.dart';
import 'package:atieed/screens/home_screen.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:atieed/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class SignupTab extends StatefulWidget {
  const SignupTab({super.key});

  @override
  State<SignupTab> createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> {
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
              text: 'Create Account',
              fontSize: 18,
            ),
            TextWidget(
              text: 'New here? Let’s create your first account.',
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
            TextFieldWidget(
              isObscure: true,
              width: double.infinity,
              controller: confirmpassword,
              label: 'Re-enter Password',
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget(
                fontSize: 14,
                width: 150,
                label: 'Create account',
                onPressed: () {
                  if (password.text == confirmpassword.text) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FirstPage(
                              auth: {
                                'email': email.text,
                                'password': password.text
                              },
                            )));
                  } else {
                    showToast('Password do not match!');
                  }
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
}

import 'package:atieed/screens/auth/registration_pages/third_page.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final bdate = TextEditingController();
  final gradelevel = TextEditingController();
  final studentnumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  SizedBox(
                    width: 100,
                    child: Divider(
                      thickness: 5,
                      color: primary,
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
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      TextFieldWidget(
                        width: 350,
                        controller: name,
                        label: 'Name',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 175,
                            child: TextFieldWidget(
                              controller: bdate,
                              label: 'Birthdate',
                            ),
                          ),
                          SizedBox(
                            width: 175,
                            child: TextFieldWidget(
                              controller: gradelevel,
                              label: 'Grade Level',
                            ),
                          ),
                        ],
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: studentnumber,
                        label: 'Student Number',
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: email,
                        label: 'Email',
                      ),
                      TextFieldWidget(
                        width: 350,
                        controller: password,
                        label: 'Password',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonWidget(
                  fontSize: 18,
                  width: 150,
                  label: 'Next',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThirdPage()));
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:atieed/screens/auth/registration_pages/second_page.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:atieed/widgets/button_widget.dart';
import 'package:atieed/widgets/text_widget.dart';
import 'package:atieed/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  Map auth;

  FirstPage({super.key, required this.auth});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final ins = TextEditingController();
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
              TextWidget(
                maxLines: 2,
                text: 'Select Your Respective Institution',
                fontSize: 32,
                fontFamily: 'Bold',
                color: primary,
              ),
              const SizedBox(
                height: 20,
              ),
              Icon(
                Icons.location_city_rounded,
                color: primary,
                size: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                label: 'Institution',
                controller: ins,
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
                        builder: (context) => SecondPage(
                              inst: ins.text,
                              auth: widget.auth,
                            )));
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

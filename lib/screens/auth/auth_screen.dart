import 'package:atieed/screens/auth/login_tab.dart';
import 'package:atieed/screens/auth/signup_tab.dart';
import 'package:atieed/utlis/colors.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: grey, width: 3),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                            indicatorColor: primary,
                            labelColor: primary,
                            tabs: const [
                              Tab(
                                text: 'Create an account',
                              ),
                              Tab(
                                text: 'Login',
                              ),
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        const Expanded(
                          child: TabBarView(children: [
                            SignupTab(),
                            LoginTab(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

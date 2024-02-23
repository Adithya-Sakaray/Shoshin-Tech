import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:shoshin_app/Screens/home_screen.dart";
import "package:shoshin_app/Screens/login_or_register.dart";

import "../Controller/home_controller.dart";

class LoginChecker  extends StatelessWidget {
  const LoginChecker ({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();

     return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomeScreen();
          }
            
          // user is NOT logged in
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
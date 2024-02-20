import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text("signout", style: TextStyle(color: Colors.black),)
                ),
              const SizedBox(height: 50,),
              const Text(
                      "Home screen",
                      style: TextStyle(color: Colors.black),
                    ),
            ],
          )),
    );
  }
}

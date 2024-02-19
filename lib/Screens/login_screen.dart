import 'package:flutter/material.dart';
import 'package:shoshin_app/Screens/forgot_password_screen.dart';
import 'package:shoshin_app/utils/gaps.dart';
import 'package:shoshin_app/utils/my_alert_box.dart';
import 'package:shoshin_app/utils/my_button.dart';
import 'package:shoshin_app/utils/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoading = false;

  void showAlertBox(String text) {
    showDialog(context: context, builder: (context) {
      return MyAlertBox(text: text);
    });
  }

  void loginUser() async {
    try {

      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertBox('No user found for that email.');
        setState(() {
        isLoading = false;
      });
      } else if (e.code == 'wrong-password') {
        showAlertBox('Wrong password provided for that user.');
        setState(() {
        isLoading = false;
      });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 70,
              ),
              mediumGap(),
              const Text("Welcome, back you've been missed!"),
              mediumGap(),
              MyTextfield(
                  controller: _emailController,
                  hintText: "E-Mail",
                  shouldObscureText: false),
              smallGap(),
              MyTextfield(
                  controller: _passwordController,
                  hintText: "Password",
                  shouldObscureText: true),
              smallGap(),
              GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 220,
                      ),
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen()));
                        }),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              smallGap(),
              GestureDetector(
                  onTap: loginUser, child: isLoading? const CircularProgressIndicator() : myButton("Login", context)),
              mediumGap(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or continue with"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ]),
              ),
              smallGap(),
              smallGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
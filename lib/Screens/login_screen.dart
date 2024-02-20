import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:shoshin_app/Screens/forgot_password_screen.dart';
import 'package:shoshin_app/utils/gaps.dart';
import 'package:shoshin_app/utils/my_button.dart';
import 'package:shoshin_app/utils/my_textfield.dart';

import '../Controller/login_controller.dart';

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
      body: GetX<LoginController>(
        init: LoginController(),
        builder: (loginController) => SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                mediumGap(),

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
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                mediumGap(),
                GestureDetector(
                    onTap: () => loginController.loginUser(
                        _emailController.text.trim(),
                        _passwordController.text.trim()),
                    child: loginController.isLoading.value ? const CircularProgressIndicator() : myButton("Login", context)),

                mediumGap(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?", style: TextStyle(color: Colors.black),),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
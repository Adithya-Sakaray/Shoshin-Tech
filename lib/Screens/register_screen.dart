import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_app/Controller/register_controller.dart';
import 'package:shoshin_app/utils/gaps.dart';
import 'package:shoshin_app/utils/my_button.dart';
import 'package:shoshin_app/utils/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;

  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  var isLoading = false.obs;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetX<RegisterController>(
        init: RegisterController(),
        builder: (registerController) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(
                  Icons.lock,
                  size: 60,
                ),
                mediumGap(),
                const Text(
                  "Hello There!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                mediumGap(),
                MyTextfield(
                  controller: _nameController,
                  hintText: "Name",
                  shouldObscureText: false,
                ),
                smallGap(),
                MyTextfield(
                  controller: _emailController,
                  hintText: "E-Mail",
                  shouldObscureText: false,
                ),
                smallGap(),
                MyTextfield(
                  controller: _password1Controller,
                  hintText: "Password",
                  shouldObscureText: true,
                ),
                smallGap(),
                MyTextfield(
                  controller: _password2Controller,
                  hintText: "Confirm Password",
                  shouldObscureText: true,
                ),
                smallGap(),
                mediumGap(),
                GestureDetector(
                  onTap: () => registerController.registerUserWithEmail(
                    _password1Controller.text.trim(),
                    _password2Controller.text.trim(),
                    _emailController.text.trim(),
                    _nameController.text.trim(),
                    context
                  ),
                  child: registerController.isLoading.value
                      ? const CircularProgressIndicator()
                      : myButton("Register", context),
                ),
                mediumGap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Colors.black),),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

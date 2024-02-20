import 'package:flutter/material.dart';
import 'package:shoshin_app/theme.dart';

class MyTextfield  extends StatelessWidget {
  final controller;
  final String hintText;
  final bool shouldObscureText;

  const MyTextfield ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.shouldObscureText
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: shouldObscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.background),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10)
          ),
          fillColor: lightGrey,
          filled: true,
        ),
      ),
    );
  }
}
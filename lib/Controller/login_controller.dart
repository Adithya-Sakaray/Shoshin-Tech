import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoshin_app/utils/my_alert_box.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  void showAlertBox(String text) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return MyAlertBox(text: text);
        });
  }

  void loginUser(
      String email,
      String password
      ) async {
    try {

      if(email != "" && password != "") {
        isLoading.value = true;
      } else {
        showAlertBox("Please enter the credentials");
      }

        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);

        isLoading.value = false;


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertBox('No user found for that email.');
        isLoading.value = false;
      } else if (e.code == 'wrong-password') {
        showAlertBox('Wrong password provided for that user.');
        isLoading.value = false;
      } else {
        showAlertBox(e.toString());
        isLoading.value = false;
      }
    }
  }
}

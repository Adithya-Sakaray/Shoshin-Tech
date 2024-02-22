import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoshin_app/utils/my_alert_box.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var showError = false.obs;
  var errorMsg = "".obs;

  void showAlertBox(String text, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(text: text);
      },
    );
  }

  void registerUserWithEmail(
    String password1,
    String password2,
    String email,
    String name,
    BuildContext currentContext
  ) async {
    isLoading.value = true;
    try {
      if(password1 == password2){
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password1,
        );
        await FirebaseFirestore.instance
            .collection("userdata")
            .doc(userCredential.user?.uid)
            .set({
          "name": name,
          "email": userCredential.user?.email,
        });
      } else {
       showError.value = true;
       errorMsg.value = "Passwords dont match";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showError.value = true;
        errorMsg.value = "Weak password";
      } else if (e.code == 'email-already-in-use') {
        showError.value = true;
        errorMsg.value = "Email already in use, please login";
      }
    } catch (e) {
      showError.value = true;
      errorMsg.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

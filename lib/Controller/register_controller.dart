import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoshin_app/utils/my_alert_box.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAlertBox("Password is too weak", currentContext);
      } else if (e.code == 'email-already-in-use') {
        showAlertBox("The email is already in use!!", currentContext);
      }
    } catch (e) {
      showAlertBox(e.toString(), currentContext);
    } finally {
      isLoading.value = false;
    }
  }
}

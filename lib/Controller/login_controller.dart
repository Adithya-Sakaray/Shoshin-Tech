import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var showError = false.obs;
  var errorMessage = "".obs;


  void loginUser(
      String email,
      String password
      ) async {
    try {

      if(email != "" && password != "") {
        isLoading.value = true;
      } else {
        errorMessage.value = "Please enter the credentials";
        showError.value = true;
      }

        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);

        isLoading.value = false;


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage.value = "No user found for that email.";
        showError.value = true;
        isLoading.value = false;
      } else if (e.code == 'wrong-password') {
        errorMessage.value = 'Wrong password provided for that user.';
        showError.value = true;
        isLoading.value = false;
      } else {
        errorMessage.value = e.toString();
        showError.value = true;
        isLoading.value = false;
      }
    }
  }
}

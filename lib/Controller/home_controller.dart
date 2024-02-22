import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  var db = FirebaseFirestore.instance;
  var userName = "".obs;
  var userEmail = "".obs;

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> getUserDetails() async {

    final userId = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("userdata").doc("$userId");
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        userName.value = data["name"];
        userEmail.value = data["email"];
        return userName.value;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return "";
  }
}
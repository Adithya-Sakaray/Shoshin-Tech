import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_app/Screens/login_checker.dart';
import 'package:shoshin_app/firebase_options.dart';
import 'package:shoshin_app/theme.dart';

import 'Controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Shoshin',
      theme: lightThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home:  LoginChecker(),
    );
  }
}

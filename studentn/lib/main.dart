// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentn/screens/auth/activation_page.dart';
import 'package:studentn/screens/home_view.dart';

main() {
  runApp(QuizAppStudent());
}

class QuizAppStudent extends StatefulWidget {
  const QuizAppStudent({Key? key}) : super(key: key);

  @override
  State<QuizAppStudent> createState() => _QuizAppStudentState();
}

class _QuizAppStudentState extends State<QuizAppStudent> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controlUserLogin();
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: (isLogin == false) ? ActivationPage() : HomePage(),
      // home: HomePage(),
    );
  }

  controlUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? deviceId = prefs.getBool('isRemember');
    if (deviceId == true) {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }
}
//{
//"membership_expired_message":"message"
//}

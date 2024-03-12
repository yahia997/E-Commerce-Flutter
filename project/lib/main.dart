import 'package:flutter/material.dart';
// import 'package:project/screens/HomeScreen.dart';
import 'package:project/screens/login_screen.dart';

// will be login screen later and it will navigate user to home screen after logging in
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // to change global font
      theme: ThemeData(
        fontFamily: "DMSans",
      ),
      
      home: const login_screen(),
    );
  }
}

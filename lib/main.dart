import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/ui/First_Screen.dart';
import 'package:hospital/ui/check_code_page.dart';
import 'package:hospital/ui/login_screen.dart';
import 'package:hospital/ui/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme().copyWith(),
      ),
      home: FirstScreen(),
    );
  }
}

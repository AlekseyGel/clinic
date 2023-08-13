import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/ui/doctors_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.5,
            foregroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme().copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      home: const DoctorPage(),
    );
  }
}

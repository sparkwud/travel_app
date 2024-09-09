import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      home: const OnboardingScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(textTheme),
      ),
    );
  }
}

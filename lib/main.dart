import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Bridge());
}

class Bridge extends StatelessWidget {
  const Bridge({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
            primaryColor: brown,
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
        home: const SplashScreen());
  }
}

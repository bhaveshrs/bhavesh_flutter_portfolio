import 'package:bhavesh_flutter_portfolio/features/home.dart';
import 'package:bhavesh_flutter_portfolio/features/splash_screen.dart';
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.darkScaffoldColor,
          useMaterial3: true,
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
              .apply( 
                bodyColor: Colors.white,
              )
              .copyWith(
                bodyLarge: const TextStyle(color: AppColors.iconTextColor),
                bodyMedium: const TextStyle(color: AppColors.iconTextColor),
              ),
        ),
        home: const HomePage());
  }
}

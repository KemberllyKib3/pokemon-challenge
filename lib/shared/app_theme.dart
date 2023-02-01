import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  return ThemeData(
    primaryColor: AppColors.red,
    textTheme: GoogleFonts.sourceSansProTextTheme(),
    iconTheme: const IconThemeData(
      color: AppColors.white,
      size: 25,
    ),
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 0,
      iconColor: AppColors.gray,
      tileColor: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

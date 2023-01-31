import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/shared.dart';

class WidgetsFunctions {
  static AppBar bigAppBar(
    BuildContext context, {
    IconButton? leading,
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 120,
      backgroundColor: AppColors.red,
      leading: leading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo, height: 45, width: 45),
          const SizedBox(height: 5),
          const Text(
            'PokéChallenge',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static AppBar smallAppBar(
    BuildContext context, {
    String title = '',
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.red,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

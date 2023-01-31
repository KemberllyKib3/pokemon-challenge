import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/shared.dart';

class WidgetsFunctions {
  static AppBar bigAppBar(
    BuildContext context, {
      IconButton? leading,
    }
  ) {
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
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(70),
      //   child: Container(
      //     color: AppColors.red,
      //     alignment: Alignment.centerLeft,
      //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      //     child:
      //   ),
      // ),
    );
  }
}

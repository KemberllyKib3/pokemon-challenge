import 'package:flutter/material.dart';

import 'package:pokemon_challenge/shared/app_colors.dart';
import 'package:pokemon_challenge/shared/shared.dart';

class ShowMoreWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ShowMoreWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add,
              color: AppColors.gray,
              size: 35,
            ),
            SizedBox(height: 10),
            Text(
              'Show more',
              style: TextStyle(
                color: AppColors.gray,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

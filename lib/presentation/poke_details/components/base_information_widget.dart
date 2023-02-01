// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/app_colors.dart';

class BaseInformationWidget extends StatelessWidget {
  final int height;
  final int weight;
  final int baseExperience;

  const BaseInformationWidget({
    Key? key,
    required this.height,
    required this.weight,
    required this.baseExperience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Base Information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildColumn("HEIGHT", '${height / 10} m')),
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.gray,
                ),
                Expanded(child: _buildColumn('WEIGHT', '${weight / 10} kg')),
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.gray,
                ),
                Expanded(
                  child: _buildColumn("BASE EXP.", baseExperience.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

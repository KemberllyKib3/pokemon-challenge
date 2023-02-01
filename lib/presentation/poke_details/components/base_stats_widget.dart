import 'package:flutter/material.dart';

import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/shared/shared.dart';

class BaseStatsWidget extends StatelessWidget {
  final String title;
  final List<Stats> stats;

  const BaseStatsWidget({
    Key? key,
    required this.title,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isHigher(int value) {
      final List<int> values = stats.map((e) => e.stat).toList();
      return value == values.reduce((curr, next) => curr > next ? curr : next);
    }

    bool isLower(int value) {
      final List<int> values = stats.map((e) => e.stat).toList();
      return value == values.reduce((curr, next) => curr < next ? curr : next);
    }

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
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Column(
                  children: stats.map(
                    (stat) {
                      Color? color = isHigher(stat.stat)
                          ? AppColors.success
                          : isLower(stat.stat)
                              ? AppColors.error
                              : AppColors.blue;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                stat.initials.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                stat.stat.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: LinearProgressIndicator(
                                  value: stat.stat / 100,
                                  minHeight: 7,
                                  backgroundColor: Colors.grey[300],
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(color),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

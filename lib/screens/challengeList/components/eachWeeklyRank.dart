import 'package:flutter/material.dart';
import '../../../../models/weeklyRank.dart';
import 'rankDetail.dart';

class EachWeeklyRank extends StatelessWidget {
  final WeeklyRank weeklyRank;

  EachWeeklyRank({required this.weeklyRank});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              weeklyRank.imageUrl,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          RankDetail(weeklyRankList: weeklyRank)
        ],
      ),
    );
  }
}
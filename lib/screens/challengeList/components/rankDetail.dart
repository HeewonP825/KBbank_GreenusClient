import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/weeklyRank.dart';
//import 'eachWeeklyRank.dart';
import '../../../components/ImageContainer.dart';
import '../../../../theme.dart';

// class RankDetail extends StatelessWidget {
//   final WeeklyRank weeklyRank;
//
//   const RankDetail({required this.weeklyRank});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       //children: [
//         //Positioned(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                 Text(weeklyRank.name, style: textTheme().bodyText1),
//                 const SizedBox(height: 4.0),
//                 Text('Lv.${(weeklyRank.level)}'),
//                 const SizedBox(height: 4.0),
//                 Text(
//                   '스탬프 갯수: ${(weeklyRank.stampNum)}${weeklyRank.stampText}}',
//                   style: textTheme().headline2,
//                 ),
//             const Spacer(),
//             ],
//           ),
//     );
//  // }
//             //],
//           //)
//         //)
//       //]
//       /*child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(weeklyRank.name, style: textTheme().bodyText1),
//           const SizedBox(height: 4.0),
//           Text('Lv.${(weeklyRank.level)}'),
//           const SizedBox(height: 4.0),
//           Text(
//             '스탬프 갯수: ${(weeklyRank.stampNum)}${weeklyRank.stampText}}',
//             style: textTheme().headline2,
//           ),
//           const Spacer(),
//         ],
//       ),*/
//    // );
//   }
// }

class RankDetail extends StatelessWidget {
  const RankDetail({
    Key? key,
    required this.weeklyRankList,
  }) : super(key: key);

  final WeeklyRank weeklyRankList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ImageContainer(
              width: 50,
              height: 50,
              borderRadius: 25,
              imageUrl: weeklyRankList.imageUrl,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(text: weeklyRankList.level),
                      TextSpan(text: weeklyRankList.levelNum.toString()),
                    ]),
                  ),
                  const Spacer(),
                  Text(
                    weeklyRankList.name,
                    style: textTheme().headline2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text.rich(
                    TextSpan(children: [
                        TextSpan(text: weeklyRankList.stampNum.toString()),
                        TextSpan(text: weeklyRankList.stampText),
                    ]),
                  ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../models/friendList.dart';
import '../../../theme.dart';
import '../../components/ImageContainer.dart';

class FriendContainer extends StatelessWidget {
  const FriendContainer({
    Key? key,
    required this.friendList,
  }) : super(key: key);

  final FriendList friendList;

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
              width: 60,
              height: 60,
              borderRadius: 30,
              imageUrl: friendList.profileImage,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(text: friendList.level),
                      TextSpan(text: friendList.levelNum.toString()),
                    ]),
                  ),
                  const Spacer(),
                  Text(
                    friendList.friendName,
                    style: textTheme().headline1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    friendList.message,
                    style: textTheme().subtitle1,
                    overflow: TextOverflow.ellipsis,
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
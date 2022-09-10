import 'package:flutter/material.dart';

import '../../../models/friendList.dart';
import '../../../theme.dart';
import '../../components/ImageContainer.dart';

class MissionFriendContainer extends StatefulWidget {
  const MissionFriendContainer({
    Key? key,
    required this.friendList,
  }) : super(key: key);

  final FriendList friendList;
  // use this
  @override
  _MissionFriendContainerState createState() => _MissionFriendContainerState();
}

class _MissionFriendContainerState extends State<MissionFriendContainer> {

  late final FriendList friendList;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    print("Friend List build start");
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
      height: 96,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ImageContainer(
              width: 55,
              height: 55,
              borderRadius: 27.5,
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
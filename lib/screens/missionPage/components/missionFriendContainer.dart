import 'package:flutter/material.dart';

import '../../../models/friendList.dart';
import '../../../theme.dart';
import '../../components/ImageContainer.dart';

typedef void IntCallback(int friendId,String profileUrl,bool isChecked);
class MissionFriendContainer extends StatefulWidget {
  final IntCallback onSonChanged;
  bool isChecked;
  MissionFriendContainer({
    Key? key,
    required this.friendList,
    required this.onSonChanged,
    required this.isChecked,
  }) : super(key: key);

  final FriendList friendList;
  // use this
  @override
  _MissionFriendContainerState createState() => _MissionFriendContainerState();
}

class _MissionFriendContainerState extends State<MissionFriendContainer> {
  late bool _isChecked;
  late bool tempIsChecked;
  bool isInitialize=false;
  @override
  Widget build(BuildContext context) {
    _isChecked = widget.isChecked;
    if(isInitialize==true){
      _isChecked=tempIsChecked;
    }
    print("Friend List build start");
    return GestureDetector(
      onTap: (){
        setState(() {
          tempIsChecked=!_isChecked;
          isInitialize=true;
          widget.onSonChanged(widget.friendList.friendId,widget.friendList.profileImage,_isChecked);
          //isChecked가 true인 경우. 외부 List에 friendId 추가
          //isChecked가 false인 경우. 외부 List에서 friendId제거.
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: _isChecked? 2.8 : 0.2,
            color: _isChecked? Colors.blueGrey : Colors.grey,
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
        height: 101,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              // Checkbox(
              //   value: _isChecked,
              //   onChanged: (value) {
              //     setState(() {
              //       _isChecked = value!;
              //     });
              //   },
              // ),
              // Switch(
              //   value: _isChecked,
              //   onChanged: (value) {
              //     setState(() {
              //       _isChecked = value!;
              //     });
              //   },
              // ),
              ImageContainer(
                width: 55,
                height: 55,
                borderRadius: 27.5,
                imageUrl: widget.friendList.profileImage,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: widget.friendList.level),
                        TextSpan(text: widget.friendList.levelNum.toString()),
                      ]),
                    ),
                    const Spacer(),
                    Text(
                      widget.friendList.friendName,
                      style: textTheme().headline1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      widget.friendList.message,
                      style: textTheme().subtitle1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
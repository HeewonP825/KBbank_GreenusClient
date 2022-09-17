
import 'package:flutter/material.dart';

import '../../../models/friendList.dart';
import '../../../theme.dart';
import '../../components/ImageContainer.dart';

class SearchFriendContainer extends StatelessWidget {
  const SearchFriendContainer({
    Key? key,
    required this.friendList,
  }) : super(key: key);

  final FriendList friendList;

  @override
  Widget build(BuildContext context) {
    print("Friend List build start");
    return GestureDetector(
      onTap: (){
        print("클릭");
      },
      child: Container(
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
          color: Colors.  white,
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
                    Row(
                      children: [
                        Text(
                          friendList.friendName,
                          style: textTheme().headline1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                            " #"+friendList.secondId.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff646361),
                            ),
                            overflow: TextOverflow.ellipsis,

                        )
                      ],
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
              Expanded(
                  child: ElevatedButton(
                    child: Text("친구 요청중"),
                    onPressed: (){
                      print("하핳 클릭됐다!~");
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Color(0xff111421))
                            )
                        )
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
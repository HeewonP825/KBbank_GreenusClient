import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/missionRankUserInfo.dart';

class UserInfoWithoutRankWidget extends StatelessWidget {
  final MissionRankUserInfo rankUserInfo;

  const UserInfoWithoutRankWidget(this.rankUserInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 90,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 1.5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [ //순위
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Container(
              //profileImage
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(15, 10, 6, 10),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new Image.network(
                      rankUserInfo.profileImgUrl
                  )
                      .image,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 7,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lv.",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      rankUserInfo.userLevel.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      rankUserInfo.userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rankUserInfo.stampNum.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      rankUserInfo.totalStampNum.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

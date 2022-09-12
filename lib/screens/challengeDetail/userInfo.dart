import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/missionRankUserInfo.dart';

class UserInfoWidget extends StatelessWidget {
  final MissionRankUserInfo rankUserInfo;

  const UserInfoWidget(this.rankUserInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 85,
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
        children: [
          Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: (rankUserInfo.ranking.toString()!="순위권 밖")?
              Container(
                child: Image.asset(
                  rankUserInfo.ranking,
                  width: 45,
                  height: 50,
                  fit: BoxFit.fitWidth,
                ),
              ):
              Text(rankUserInfo.ranking.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ))), //순위
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
                          "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
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
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                      "인증 횟수: ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
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

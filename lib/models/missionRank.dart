import 'package:dio/dio.dart';

class missionRank {
  final String imageUrl;
  final String name;
  final String level;
  final int levelNum;
  final int stampNum;
  final String stampText;
  final String ranking;

  missionRank({
    required this.imageUrl,
    required this.name,
    required this.level,
    required this.levelNum,
    required this.stampNum,
    required this.stampText,
    required this.ranking,
  });
}

Future<List<missionRank>> receiveMissionRankList() async {
  print("receive Weekly Rank List run");
  //Todo userId수정 필요
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.get('/app/friends/rank/${userId}');

  print("missionRank Response");
  print(1.toString()+"동");
  print(response.data["result"]);
  final rankList = response.data["result"]['rankLists'];
  print(rankList);

  List<missionRank> missionRankList = [];

  for (int i = 0; i < rankList.length; i++) {
    String rankStr="";
    switch(i){
      case 0:
        rankStr="Me";
        break;
      case 1:
        rankStr=rankList[i]['ranking'].toString()+"st";
        break;
      case 2:
        rankStr=rankList[i]['ranking'].toString()+"nd";
        break;
      case 3:
        rankStr=rankList[i]['ranking'].toString()+"rd";
        break;
    }

    missionRankList.add(missionRank(
      imageUrl: rankList[i]['profileImgUrl'],
      name: rankList[i]['userName'],
      level: "Lv. ",
      levelNum: rankList[i]['userLevel'],
      stampNum: rankList[i]['stamp'],
      stampText: "개",
      ranking: rankStr,
    ));
  }

  return missionRankList;
}

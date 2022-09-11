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
    var rank=rankList[i]['ranking'];
    String rankStr="";
    switch(rank){
      case 0:
        rankStr="Me";
        break;
      case 1:
        rankStr="assets/icons/gold.png";
        break;
      case 2:
        rankStr="assets/icons/silver.png";
        break;
      case 3:
        rankStr="assets/icons/bronze.png";
        break;
      case 4:
        rankStr="assets/icons/4.png";
        break;
      case 5:
        rankStr="assets/icons/5.png";
        break;
      case 6:
        rankStr="assets/icons/6.png";
        break;
      case 7:
        rankStr="assets/icons/7.png";
        break;
      case 8:
        rankStr="assets/icons/8.png";
        break;
      case 9:
        rankStr="assets/icons/9.png";
        break;
      case 10:
        rankStr="assets/icons/10.png";
        break;
      default:
        rankStr="순위권 밖"; //Todo 10명넘었을때도 에러 발생 안하도록 대처할것.
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

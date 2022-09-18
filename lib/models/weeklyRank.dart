import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
class WeeklyRank {
  final String imageUrl;
  final String name;
  final String level;
  final int levelNum;
  final int stampNum;
  final String stampText;
  final String ranking;

  WeeklyRank({
    required this.imageUrl,
    required this.name,
    required this.level,
    required this.levelNum,
    required this.stampNum,
    required this.stampText,
    required this.ranking,
  });
}

// List<WeeklyRank> weeklyRankList = [
//   WeeklyRank(
//     imageUrl:"https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     name: "♢ ♢ ♢",
//     level: 'lv',
//     levelNum: 3,
//     stampNum: 3,
//     stampText: "개",
//   ),
//   WeeklyRank(
//     imageUrl:"https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     name: "♢ ♢ ♢",
//     level: 'lv',
//     levelNum: 3,
//     stampNum: 3,
//     stampText: "개",
//   ),
//   WeeklyRank(
//     imageUrl:"https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     name: "♢ ♢ ♢",
//     level: 'lv',
//     levelNum: 3,
//     stampNum: 3,
//     stampText: "개",
//   ),
//   WeeklyRank(
//     imageUrl:"https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     name: "♢ ♢ ♢",
//     level: 'lv',
//     levelNum: 3,
//     stampNum: 3,
//     stampText: "개",
//   ),
// ];

Future<List<WeeklyRank>> receiveWeeklyRankList() async {
  print("receive Weekly Rank List run");
  //Todo userId수정 필요
  // var userId = 1;
  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
  print('토큰 정보 보기 성공'
      '\n회원정보: ${tokenInfo.id}'
      '\n만료시간: ${tokenInfo.expiresIn} 초');

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.get('/app/friends/rank/${tokenInfo.id}');

  print("WeeklyRank Response");
  print(1.toString()+"동");
  print(response.data["result"]);
  final myInfo = response.data["result"]['myInfo'];
  final rankList = response.data["result"]['rankLists'];
  print(myInfo);
  print(rankList);

  List<WeeklyRank> weeklyRankList = [];

  for (int i = 0; i < rankList.length; i++) {
    String rankStr="";
    switch(i){
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
    }

    weeklyRankList.add(WeeklyRank(
      imageUrl: rankList[i]['profileImgUrl'],
      name: rankList[i]['userName'],
      level: "Lv. ",
      levelNum: rankList[i]['userLevel'],
      stampNum: rankList[i]['stamp'],
      stampText: "개",
      ranking: rankStr,
    ));
  }

  return weeklyRankList;
}

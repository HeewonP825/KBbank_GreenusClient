import 'package:dio/dio.dart';

class Feed {
  final String profileImgUrl;
  final String userName;
  final int userLevel;
  final int heartCount;
  final DateTime createdAt;
  final List<String> certifyImgUrl;

  Feed({
    required this.profileImgUrl,
    required this.userName,
    required this.userLevel,
    required this.heartCount,
    required this.createdAt,
    required this.certifyImgUrl,
  });
}

Future<List<Feed>> receiveFeeds(groupId) async {
  //Todo userId수정 필요

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.get(
      '/app/group/${groupId}/confirmationPage');

  print("Feed를 쌓자!Feed를 쌓자!Feed를 쌓자!Feed를 쌓자!");
  print("Feed를 쌓자!Feed를 쌓자!Feed를 쌓자!Feed를 쌓자!");
  print("Feed를 쌓자!Feed를 쌓자!Feed를 쌓자!Feed를 쌓자!");
  print(response);
  print(response.data);
  print(response.data["result"]);
  final data = response.data["result"];

  List<Feed> feedLists = [];

  print(data);
  for(int i=0;i<data.length;i++){
    var dateStringList=data[i]['day'].split('-');
    print(dateStringList);
    var year=int.parse(dateStringList[0]);
    var month=int.parse(dateStringList[1]);
    var day=int.parse(dateStringList[2]);
    var created=DateTime(year,month,day);
    print(data[i]['ImgUrl'].map((e) => e.toString()).toList());
    // var strList=data[i]['ImgUrl'].map((e) => e.toString()).toList();
    List<String> strList=data[i]['ImgUrl']?.cast<String>();

    feedLists.add(Feed(
        createdAt: created,
        heartCount: data[i]['likeNum'],
        profileImgUrl: data[i]['profileImgUrl'],
        userName: data[i]['userName'],
        certifyImgUrl: strList,
        userLevel:data[i]['userLevel'],
    ));
  }

  return feedLists;
}
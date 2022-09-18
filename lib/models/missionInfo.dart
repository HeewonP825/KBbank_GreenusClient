import 'package:dio/dio.dart';

class MissionInfo {
  final int missionId;
  final String missionName;
  final String descriptionImgUrl;
  final String descriptionComment1;
  final String descriptionComment2;
  final String goal;

  MissionInfo({
    required this.missionId,
    required this.missionName,
    required this.descriptionImgUrl,
    required this.descriptionComment1,
    required this.descriptionComment2,
    required this.goal,
  });
}

Future<List<MissionInfo>> receiveMissionInfo() async {
  //Todo userId수정 필요
  // var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response= await dio.get('/app/missionLists');

  print(response.data);
  print(response.data["result"]);
  final data=response.data["result"];

  List<MissionInfo> missionList=[];

  for(int i=0; i<data.length; i++){

    missionList.add(MissionInfo(
      missionId:data[i]['missionId'],
      missionName: data[i]['missionName'],
      goal: data[i]['goal'],
      descriptionImgUrl: data[i]['descriptionImgUrl'],
      descriptionComment1: data[i]['descriptionComment1'],
      descriptionComment2: data[i]['descriptionComment2'],
    ));
  }

  print("get missionList");
  print(missionList);

  return missionList;
}

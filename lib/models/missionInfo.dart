import 'package:dio/dio.dart';

class MissionInfo {
  final int missionId;
  final String missionName;
  final String descriptionImgUrl;


  MissionInfo({
    required this.missionId,
    required this.missionName,
    required this.descriptionImgUrl,
  });
}

Future<List<MissionInfo>> receiveMissionInfo() async {
  //Todo userId수정 필요
  var userId = 1;

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
      descriptionImgUrl: data[i]['descriptionImgUrl'],
    ));
  }

  print("get missionList");
  print(missionList);

  return missionList;
}

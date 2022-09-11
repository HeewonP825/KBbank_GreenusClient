import 'package:dio/dio.dart';

import 'FriendProfile.dart';

class FinishMissionData {

  final int groupId;
  final String missionName;
  final String backgroundImage;
  final String startDate;
  final String finishDate;
  final List<FriendProfile> friendProfileList;

  FinishMissionData({
    required this.groupId,
    required this.missionName,
    required this.backgroundImage,
    required this.startDate,
    required this.finishDate,
    required this.friendProfileList,
  });
}

// List<FinishMissionData> finishMissionData = [
//   FinishMissionData(
//     missionName: '일주일에 세 번 이상 채식하기',
//     backgroundImage: "assets/images/banner1.jpg",
//     startDate: '2022.07.31',
//     finishDate: '2022.08.31',
//     profileImage1: "assets/images/banner1.jpg",
//     profileImage2: "assets/images/banner1.jpg",
//     profileImage3: "assets/images/banner1.jpg",
//   ),
//   FinishMissionData(
//     missionName: '일주일에 세 번 이상 채식하기',
//     backgroundImage: "assets/images/banner1.jpg",
//     startDate: '2022.07.31',
//     finishDate: '2022.08.31',
//     profileImage1: "assets/images/banner1.jpg",
//     profileImage2: "assets/images/banner1.jpg",
//     profileImage3: "assets/images/banner1.jpg",
//   ),
//   FinishMissionData(
//     missionName: '일주일에 세 번 이상 채식하기',
//     backgroundImage: "assets/images/banner1.jpg",
//     startDate: '2022.07.31',
//     finishDate: '2022.08.31',
//     profileImage1: "assets/images/banner1.jpg",
//     profileImage2: "assets/images/banner1.jpg",
//     profileImage3: "assets/images/banner1.jpg",
//   ),
//   FinishMissionData(
//     missionName: '일주일에 세 번 이상 채식하기',
//     backgroundImage: "assets/images/banner1.jpg",
//     startDate: '2022.07.31',
//     finishDate: '2022.08.31',
//     profileImage1: "assets/images/banner1.jpg",
//     profileImage2: "assets/images/banner1.jpg",
//     profileImage3: "assets/images/banner1.jpg",
//   ),
//   FinishMissionData(
//     missionName: '일주일에 세 번 이상 채식하기',
//     backgroundImage: "assets/images/banner1.jpg",
//     startDate: '2022.07.31',
//     finishDate: '2022.08.31',
//     profileImage1: "assets/images/banner1.jpg",
//     profileImage2: "assets/images/banner1.jpg",
//     profileImage3: "assets/images/banner1.jpg",
//   ),
// ];


Future<List<FinishMissionData>> receiveFinishMissionData() async {
  //Todo userId수정 필요
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response= await dio.get('/app/MyMissionLists/${userId}', queryParameters: {
    'status': 'completed'
  });

  print(response);
  print(response.data);
  print(response.data["result"]);
  final data=response.data["result"];

  List<FinishMissionData> ingMissionLists=[];
  List<FriendProfile> friendProfileList=[];

  print("friends");
  print(data[0]['friends'].runtimeType);
  print(data[0]['friends'][0]['profileImgUrl']);

  for(int i=0; i<data.length; i++){
    for(int j=0; j<data[i]['friends'].length; j++){
      if(j>5) break;
      friendProfileList.add(
          FriendProfile(profileUrl: data[i]['friends'][j]['profileImgUrl'])
      );
    }
    ingMissionLists.add(FinishMissionData(
      groupId:data[i]['groupId'],
      missionName: data[i]['missionName'],
      backgroundImage: "assets/images/banner1.jpg",
      startDate: data[i]['startDate'],
      finishDate:data[i]['endDate'],
      friendProfileList: friendProfileList,
    ));
  }

  print(ingMissionLists[0].finishDate);
  return ingMissionLists;
}


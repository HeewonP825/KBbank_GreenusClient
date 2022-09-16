import 'package:dio/dio.dart';

class HomeBanner {
  final String bannerImage;
  final String bannerTitle;
  final String eventTitle;
  final String eventContent;

  HomeBanner(
      {required this.eventTitle,
        required this.bannerTitle,
        required this.eventContent,
        required this.bannerImage
      });
}

// 샘플 데이터
// List<HomeBanner> homeBannerList = [
//   HomeBanner(
//     bannerImage: "assets/images/banner.jpg",
//     bannerTitle: "오늘의 추천 미션",
//     eventTitle: "일주일에",
//     eventContent: "3번 이상\n도시락 싸가기",
//   ),
//   HomeBanner(
//     bannerImage: "assets/images/banner1.jpg",
//     bannerTitle: "오늘의 추천 미션",
//     eventTitle: "한 달 동안",
//     eventContent: "15일 이상\n텀블러 이용하기",
//   ),
//   HomeBanner(
//     bannerImage: "assets/images/banner1.jpg",
//     bannerTitle: "오늘의 추천 미션",
//     eventTitle: "3개월동안\n일회용 비닐 봉지 대신",
//     eventContent: "다회용 가방 사용하기",
//   ),
//   HomeBanner(
//     bannerImage: "assets/images/banner.jpg",
//     bannerTitle: "오늘의 추천 미션",
//     eventTitle: "3개월 동안",
//     eventContent: "1주일에 4번 이상\n 채식하기",
//   ),
//   HomeBanner(
//     bannerImage: "assets/images/banner1.jpg",
//     bannerTitle: "오늘의 추천 미션",
//     eventTitle: "한 달 동안",
//     eventContent: "20번 이상\n 개인빨대 이용하기",
//   ),
//   HomeBanner(
//     bannerImage: "assets/images/banner.jpg",
//     bannerTitle: "오늘의 추천 미션",
//     eventTitle: "일주일에\n3번 이상",
//     eventContent: "자전거로 출/퇴근 하기",
//   ),
// ];

Future<List<HomeBanner>> receiveHomeBannerList() async {
  print("receive Weekly Rank List run");
  //Todo userId수정 필요
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.get('/app/recommended-Mission');

  print("receiveHomeBannerList Response");

  final homeBanner = response.data["result"];

  List<HomeBanner> homeBannerList = [];

  for (int i = 0; i < homeBanner.length; i++) {
    homeBannerList.add(HomeBanner(
      bannerImage: homeBanner[i]['category']==0? "assets/images/mission.png":"assets/images/mission1.png",
      bannerTitle: homeBanner[i]['bannerTitle'],
      eventTitle: homeBanner[i]['eventTitle'],
      eventContent:homeBanner[i]['eventContent'],
    ));
  }

  return homeBannerList;
}

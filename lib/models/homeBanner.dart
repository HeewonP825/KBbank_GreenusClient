class HomeBanner {
  final String bannerImage;
  final String bannerTitle;
  final String eventTitle;
  final String eventContent;

  HomeBanner(
      {required this.eventTitle,
        required this.bannerTitle,
        required this.eventContent,
        required this.bannerImage});
}

// 샘플 데이터
List<HomeBanner> homeBannerList = [
  HomeBanner(
    bannerImage: "assets/images/banner.jpg",
    bannerTitle: "오늘의 추천 미션",
    eventTitle: "일주일에",
    eventContent: "3번 이상\n도시락 싸가기",
  ),
  HomeBanner(
    bannerImage: "assets/images/banner1.jpg",
    bannerTitle: "오늘의 추천 미션",
    eventTitle: "한 달 동안",
    eventContent: "15일 이상\n텀블러 이용하기",
  ),
  HomeBanner(
    bannerImage: "assets/images/banner1.jpg",
    bannerTitle: "오늘의 추천 미션",
    eventTitle: "3개월동안\n일회용 비닐 봉지 대신",
    eventContent: "다회용 가방 사용하기",
  ),
  HomeBanner(
    bannerImage: "assets/images/banner.jpg",
    bannerTitle: "오늘의 추천 미션",
    eventTitle: "3개월 동안",
    eventContent: "1주일에 4번 이상\n 채식하기",
  ),
  HomeBanner(
    bannerImage: "assets/images/banner1.jpg",
    bannerTitle: "오늘의 추천 미션",
    eventTitle: "한 달 동안",
    eventContent: "20번 이상\n 개인빨대 이용하기",
  ),
  HomeBanner(
    bannerImage: "assets/images/banner.jpg",
    bannerTitle: "오늘의 추천 미션",
    eventTitle: "일주일에\n3번 이상",
    eventContent: "자전거로 출/퇴근 하기",
  ),
];
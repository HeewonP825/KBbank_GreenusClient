import 'package:flutter/material.dart';
import '../../../../models/homeBanner.dart';
import 'boxBorderText.dart';
import 'numberIndicator.dart';

class HomeRecommendMission extends StatefulWidget {
  @override
  _HomeRecommendMissionState createState() => _HomeRecommendMissionState();
}

class _HomeRecommendMissionState extends State<HomeRecommendMission> {
  // 1
  late Future<List<HomeBanner>> futureHomeBannerList;
  // 2
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    futureHomeBannerList=receiveHomeBannerList();
  }

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<List<HomeBanner>>(
          future: futureHomeBannerList,
          builder: (context,snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Stack(
                children: [
                  PageView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          // 3
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(data[index].bannerImage),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          // 4
                          Positioned(
                            top: 50,
                            left: 16,
                            child: BoxBorderText(
                              bannerTitle: data[index].bannerTitle,
                              title: data[index].eventTitle,
                              subTitle: data[index].eventContent,
                            ),
                          ),
                        ],
                      );
                    },
                    // 5
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                  ),
                  // 7
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: NumberIndicator(
                      currentPage: currentPage + 1,
                      length: data.length,
                    ),
                  )
                ],
              );
            }
          }
      );

  }
}
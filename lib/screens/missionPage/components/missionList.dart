import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/models/missionInfo.dart';
import 'missionDetail.dart';

List<String> imagesList = [];

class MissionList extends StatefulWidget {
  @override
  _MissionListState createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  int _currentIndex = 0;
  late Future<List<MissionInfo>> futureMissionList;

  void initState() {
    super.initState();
    futureMissionList = receiveMissionInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureMissionList,
        builder: (context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            print(data);
            imagesList = [];
            for (int i = 0; i < data.length; i++) {
              imagesList.add(data[i].descriptionImgUrl);
            }
            return Scaffold(
              body: Column(
                children: [
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 550,
                        // autoPlay: true,
                        // enlargeCenterPage: true,
                        //scrollDirection: Axis.vertical,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, itemIndex, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            margin: EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0,
                            ),
                            elevation: 6.0,
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MissionDetail(data[itemIndex])),
                                      );
                                    },
                                    child: Image.asset(
                                      imagesList[itemIndex],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 550,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagesList.map((urlOfItem) {
                      int index = imagesList.indexOf(urlOfItem);
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color.fromRGBO(0, 0, 0, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            );
          }
        });
  }
}

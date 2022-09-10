import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'missionDetail.dart';

final List<String> imagesList = [
  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8715c91f-ace9-4423-9cb8-5f061c12c58d/%EC%A0%9C%EB%AA%A9%EC%9D%84-%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94_-001.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220910T165830Z&X-Amz-Expires=86400&X-Amz-Signature=bb04f8155932198752533aba6471eecbd9f857cb93b1edb4ae3cb0a0ced0c6ab&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25EC%25A0%259C%25EB%25AA%25A9%25EC%259D%2584-%25EC%259E%2585%25EB%25A0%25A5%25ED%2595%25B4%25EC%25A3%25BC%25EC%2584%25B8%25EC%259A%2594_-001.png%22&x-id=GetObject',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

class MissionList extends StatefulWidget {
  @override
  _MissionListState createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 630,
                // autoPlay: true,
                // enlargeCenterPage: true,
                //scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imagesList
                  .map(
                    (item) => Padding(
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MissionDetail()),
                              );
                            },
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 630,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.map((urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
      ),
    );
  }
}
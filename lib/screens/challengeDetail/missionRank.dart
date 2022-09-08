import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import '../../../constants.dart';
import '../../../theme.dart';

class MissionRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "GREENUS",
            style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              height: 50,
              alignment: Alignment.topCenter,
              child: Center(child: Text("이전 페이지에서 미션 이름 받아와야함.")),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new Image.network(
                                "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                            .image,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: Colors.green, //Widget 추가
          onPressed: () {
            // 이벤트 콜백 함수
            Navigator.pop(
              context,
            );
          },
        ));
  }
}

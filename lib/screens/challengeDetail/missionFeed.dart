import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import '../../../constants.dart';
import '../../../theme.dart';

class MissionFeed extends StatelessWidget {
  const MissionFeed({Key? key}) : super(key: key);

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
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(
              child:
                  Text("이전 페이지에서 미션 이름 받아와야함.", style: textTheme().headline1),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFE6EFE4),
              border: Border.all(
                width: 1.5,
                color: Color(0xffffffff),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.35),
                  spreadRadius: 1.7,
                  blurRadius: 1.2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Expanded(
            flex: 7,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6EFE4),
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xffffffff),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.35),
                          spreadRadius: 1.7,
                          blurRadius: 1.2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Container(
                            //profileImage
                            alignment: Alignment.center,
                            margin: const EdgeInsets.fromLTRB(15, 10, 6, 5),
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
                          Text("정민욱"),
                        ]),
                        Divider(
                          thickness: 1.0,
                        ),
                        Container(
                          child: Row(
                            children: [
                                ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        // alignment: Alignment.center,
                                        // margin: const EdgeInsets.fromLTRB(15, 10, 6, 5),
                                        // padding: const EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          // image: new DecorationImage(
                                          //   fit: BoxFit.fill,
                                          //   image: new Image.network(
                                          //           "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                                          //       .image,
                                          ),
                                        ),
                                    ]),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ]),
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

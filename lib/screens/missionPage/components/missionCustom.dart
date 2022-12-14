import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kbbank_practice/models/missionInfo.dart';

typedef IntsCallback(String period,String count);

class MissionCustom extends StatefulWidget {
  final IntsCallback onSonChanged;
  MissionInfo missionInfo;
  MissionCustom(this.missionInfo, {Key? key, required this.onSonChanged}) : super(key: key);



  @override
  MissionCustomState createState() => MissionCustomState();
}



class MissionCustomState extends State<MissionCustom> {
  var switchValue = false;
  String n = '일주일';
  String m = '한 번';

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        //height: 50,
        alignment: Alignment.topLeft,
            child: Row(
              children: [
                // Text('6개월 '),
                // Text(' 동안 '),
                // ElevatedButton(
                //   child: Text('$n'),
                //   onPressed: () {
                //     if (n == '일주일') {
                //       setState(() {
                //         n = '한 달';
                //       });
                //     } else if (n == '한 달') {
                //       setState(() {
                //         n = '두 달';
                //       });
                //     } else if (n == '두 달') {
                //       setState(() {
                //         n = '6개월';
                //       });
                //     } else if (n == '6개월') {
                //       setState(() {
                //         n = '1년';
                //       });
                //     } else if (n == '1년') {
                //       setState(() {
                //         n = '일주일';
                //       });
                //     }
                //   },
                // ),
                ElevatedButton(
                  child: Text('$n'),
                  onPressed: () {
                    if (n == '일주일') {
                      setState(() {
                        n = '한 달';
                      });
                    } else if (n == '한 달') {
                      setState(() {
                        n = '두 달';
                      });
                    } else if (n == '두 달') {
                      setState(() {
                        n = '6개월';
                      });
                    } else if (n == '6개월') {
                      setState(() {
                        n = '1년';
                      });
                    } else if (n == '1년') {
                      setState(() {
                        n = '일주일';
                      });
                    }
                    widget.onSonChanged(n,m);
                  },
                ),
                Text('에 '),
                ElevatedButton(
                    child: Text('$m'),
                  onPressed: () {
                    if (m == '한 번') {
                      setState(() {
                        m = '두 번';
                      });
                    } else if (m == '두 번') {
                      setState(() {
                        m = '세 번';
                      });
                    } else if (m == '세 번') {
                      setState(() {
                        m = '다섯 번';
                      });
                    } else if (m == '다섯 번') {
                      setState(() {
                        m = '매일';
                      });
                    }
                    widget.onSonChanged(n,m);
                  },
                ),
                Text(widget.missionInfo.goal),
              ],
            ),
    );
  }
}
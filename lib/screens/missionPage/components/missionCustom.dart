import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MissionCustom extends StatefulWidget {
  @override
  MissionCustomState createState() => MissionCustomState();
}
class MissionCustomState extends State<MissionCustom> {
  var switchValue = false;
  String test = '일주일';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(13, 5, 20, 0),
        alignment: Alignment.topLeft,
        child: Card(
          margin: const EdgeInsets.fromLTRB(10, 10, 20, 20),
          child: ElevatedButton(
              child: Text('$test'),
              onPressed: () {
                if (test == '일주일') {
                  setState(() {
                    test = '한 달';
                  });
                } else if (test == '한 달') {
                  setState(() {
                    test = '두 달';
                  });
                } else if (test == '두 달') {
                  setState(() {
                    test = '6개월';
                  });
                } else if (test == '6개월') {
                  setState(() {
                    test = '1년';
                  });
                } else if (test == '1년') {
                  setState(() {
                    test = '일주일';
                  });
                };
              },
          ),

        ),
    );
  }
}
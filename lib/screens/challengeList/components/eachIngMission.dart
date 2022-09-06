import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/ingMissionData.dart';
import '../../../../theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EachIngMission extends StatelessWidget {

  final IngMissionData? ingMissionData;

  EachIngMission({this.ingMissionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // width: 400,
            // height: 230,
            margin: EdgeInsets.fromLTRB(6, 6, 6, 0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: new DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.7), BlendMode.dstATop),
                fit: BoxFit.cover,
                image: new AssetImage(
                    ingMissionData?.backgroundImage ?? ''
                ),
              ),
            ),
          ),
          // Card(
          //   clipBehavior: Clip.antiAlias,
          //   color: Color(0xffffff),

            Column(
              children: <Widget>[
                Container(
                  width: 5,
                  height: 5,
                  //margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //padding: const EdgeInsets.all(15.0),
                ),

                ListTile(
                  //leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(
                    ingMissionData?.missionName ?? '',
                    style: textTheme().headline1,
                  ),
                  subtitle: Text(
                    '${ingMissionData?.startDate ?? ''} ~',
                    style: textTheme().subtitle1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                              ingMissionData?.profileImage1 ?? ''
                            ),
                          ),
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(3.5, 0, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(
                              ingMissionData?.profileImage2 ?? ''
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(3.5, 0, 4, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(
                              ingMissionData?.profileImage3 ?? ''
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ButtonBar(
                //   alignment: MainAxisAlignment.start,
                //   children: [
                //     FlatButton(
                //       onPressed: () {
                //         // Perform some action
                //       },
                //       child: const Text('ACTION 1'),
                //     ),
                //   ],
                // ),
                // Container(
                //   decoration: new BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.0),
                //     image: new DecorationImage(
                //       fit: BoxFit.fill,
                //       image: new AssetImage(
                //           ingMissionData?.image ?? ''
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          // ),
        ],
        //physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
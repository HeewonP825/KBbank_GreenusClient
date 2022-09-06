import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/ingMissionData.dart';
import '../../../../theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPageIngMission extends StatelessWidget {

  final IngMissionData? ingMissionData;

  MyPageIngMission({this.ingMissionData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
              Container(
                //width: 400,
                height: 110,
                margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 1.5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.  white,
                ),
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
                    margin: const EdgeInsets.fromLTRB(15, 65, 6, 10),
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
                    margin: const EdgeInsets.fromLTRB(3.5, 65, 6, 10),
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
                    margin: const EdgeInsets.fromLTRB(3.5, 65, 4, 10),
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
            ],
    );
  }
}
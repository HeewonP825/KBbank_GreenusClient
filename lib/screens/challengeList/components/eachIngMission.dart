import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/ingMissionData.dart';
import '../../../../theme.dart';

class EachIngMission extends StatelessWidget {

  final IngMissionData? ingMissionData;

  EachIngMission({this.ingMissionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(
                    ingMissionData?.missionName ?? '',
                    style: textTheme().headline1,
                  ),
                  subtitle: Text(
                    '${ingMissionData?.startDate ?? ''} ~',
                    style: textTheme().headline1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    ingMissionData?.image ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 1'),
                    ),
                  ],
                ),
                Image.asset('assets/images/banner1.jpg'),
              ],
            ),
          )
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
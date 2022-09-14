import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/friendList.dart';

import '../../constants.dart';
import '../../theme.dart';
import 'friendListScreen.dart';
import 'friendSearch.dart';

class FriendHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1
    List<String> categories = ["친구 목록", "친구 검색"];
    // 2
    return DefaultTabController(
      // 3
      initialIndex: 0,
      // 4
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "GREENUS",
            style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
          ),
          actions: [
            //CustomActions(),
          ],
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.3, color: Colors.grey)),
                  color: Colors.white),
              child: TabBar(
                tabs: List.generate(
                  categories.length,
                      (index) => Tab(
                    text: categories[index],
                  ),
                ),
                // 5
                labelColor: kPrimaryColor,
                // 6
                unselectedLabelColor: kSecondaryColor,
                labelStyle: textTheme().headline2?.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
                // 7
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(50),
          ),
        ),
        // 8
        body: TabBarView(
          children: [
            FriendWidget(),
            FriendSearch(),
          ],
        ),
      ),
    );
  }
}
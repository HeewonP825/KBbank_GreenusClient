import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../models/myPageData.dart';

import '../../../../theme.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({
    Key? key,
    required this.myPageData,
  }) : super(key: key);

  final MyPageData myPageData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 25),
            _buildProfileButton(),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton(
                    myPageData.badge1, FontAwesomeIcons.solidHeart),
                _buildRoundTextButton(
                    myPageData.badge2, FontAwesomeIcons.solidHeart),
                _buildRoundTextButton(
                    myPageData.badge3, FontAwesomeIcons.solidHeart),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  myPageData.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100]),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: myPageData.level,
                  style: TextStyle(
                    fontFamily: 'Cafe24Ohsquare',
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                  text: myPageData.levelNum.toString(),
                  style: TextStyle(
                    fontFamily: 'Cafe24Ohsquare',
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
            SizedBox(height: 5),
            Text(
              myPageData.name,
              style: TextStyle(
                fontFamily: 'Cafe24Ohsquare',
                fontSize: 26,
              ),
            ),
          ],
        ),
        SizedBox(width: 8,),
        Column(
        mainAxisAlignment:MainAxisAlignment.end,
          children: [
            SizedBox(height: 30,),
            SizedBox(
                child: Text(
                    "#"+myPageData.secondId.toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),),

            ),
          ],
        )
      ],
    );
  }

  Widget _buildProfileButton() {
    return InkWell(
      //onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(
            width: 1.5,
            color: const Color(0xFFC3D9F1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.35),
              spreadRadius: 1.7,
              blurRadius: 1.2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 45,
        child: Center(
          child: Text(
            '😃 환영합니다! 그리너 ${myPageData.name} 님:) 😃',
            style: textTheme().subtitle1,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTextButton(String title, IconData iconData) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color(0xFFC3D9F1),
              border: Border.all(color: Color(0xFFD4D5DD), width: 0.5)),
          child: Icon(
            iconData,
            color: Color(0xff111621),
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: textTheme().subtitle1,
        )
      ],
    );
  }


}

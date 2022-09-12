import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../models/feed.dart';

class EachFeed extends StatelessWidget {
  final Feed data;
  const EachFeed(this.data,{Key? key}) : super(key: key);
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    // // send your request here
    // final bool success= (await LikeButton()) as bool;
    //
    // // if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imgList=[];
    for(int i=0; i<data.certifyImgUrl.length; i++){
      imgList.add(
        Image.network(
            data.certifyImgUrl[i])
      );
    }
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      clipBehavior: Clip.antiAlias,
      child: Column(
          children: [
            ListTile(
              leading: Container(
//profileImage
                height: 37,
                width: 37,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(2, 5, 4, 5),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new Image.network(
                        data.profileImgUrl)
                        .image,
                  ),
                ),
              ),
              title: Text(
                data.userName,
                style: TextStyle(fontFamily: 'Cafe24Ohsquare', fontSize: 20,),
              ),
              subtitle: Text(
                "Lv"+data.userLevel.toString(),
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4), fontSize: 13,),
              ),
            ),
            SizedBox(
              height: 204,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: imgList
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 10, 20, 10),
              child: Row(
                children: [
                  LikeButton(
                    mainAxisAlignment: MainAxisAlignment.start,
                    likeCount: 0,
                    onTap: onLikeButtonTapped,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(205, 10, 0, 10),
                    alignment: Alignment.topRight,
                    child: Text("2022-09-12",
                      style: TextStyle(color: Colors.black.withOpacity(0.4),),),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}



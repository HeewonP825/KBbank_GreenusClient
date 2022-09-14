import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/screens/challengeList/components/numberIndicator.dart';
import 'package:like_button/like_button.dart';

import '../../models/feed.dart';

class EachFeed extends StatefulWidget {
  final Feed data;

  const EachFeed(this.data, {Key? key}) : super(key: key);

  @override
  State<EachFeed> createState() => _EachFeedState();
}

class _EachFeedState extends State<EachFeed> {
  int currentPage = 0;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    // // send your request here
    Response response;
    if(isLiked==false){
      response=await postLike(widget.data.feedId);
      print("no Heart");
    }else{
      response=await deleteLike(widget.data.feedId); //Todo Delete들어가야함.
      print("yes Heart");
    }

    if(response.data['isSuccess']==true){
        return !isLiked;
    }else{
      return isLiked;
    }
    // final bool success= (await LikeButton()) as bool;
    //
    // // if failed, you can do nothing
    // return success? !isLiked:isLiked;

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imgList = [];
    for (int i = 0; i < widget.data.certifyImgUrl.length; i++) {
      imgList.add(
        Image.network(
          widget.data.certifyImgUrl[i],
          fit:BoxFit.fitHeight,
        ),
      );
    }
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
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
                image: new Image.network(widget.data.profileImgUrl).image,
              ),
            ),
          ),
          title: Text(
            widget.data.userName,
            style: TextStyle(
              fontFamily: 'Cafe24Ohsquare',
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            "Lv" + widget.data.userLevel.toString(),
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 13,
            ),
          ),
        ),
        Container(
            width: double.infinity,
            //alignment: Alignment.center,
            child: SizedBox(
              //width: double.infinity,
              height: 210,
              child: Stack(children: [
                PageView.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index) {
                    return imgList[index];
                  },
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: NumberIndicator(
                    currentPage: currentPage + 1,
                    length: imgList.length,
                  ),
                )
              ]),
            )),
        Container(
          margin: EdgeInsets.fromLTRB(12, 10, 20, 10),
          child: Row(
            children: [
              LikeButton(
                mainAxisAlignment: MainAxisAlignment.start,
                likeCount: widget.data.heartCount,
                onTap: onLikeButtonTapped,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(205, 10, 0, 10),
                alignment: Alignment.topRight,
                child: Text(
                  "2022-09-12",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

Future<Response> postLike(feedId) async {
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.post('/app/confirmationPage/Id/${feedId}/like');

  print(response);
  return response;
}

Future<Response> deleteLike(feedId) async {
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.delete('/app/like/feedId/${feedId}');

  print(response);
  return response;
}

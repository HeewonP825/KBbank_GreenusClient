import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/friendList.dart';
import 'package:kbbank_practice/screens/friendlist/components/friendContainer.dart';
import 'package:kbbank_practice/screens/friendlist/components/searchFriendContainer.dart';

import '../../constants.dart';
import '../../theme.dart';
import 'friendListScreen.dart';

class FriendSearch extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "$index");

  @override
  _FriendSearchState createState() => _FriendSearchState();
}

class _FriendSearchState extends State<FriendSearch> {
  late Future<List<FriendList>> futureFriends;
  late String searchValue;

  void initState() {
    super.initState();
    futureFriends=receiveSearchResult(1,"");
  }

  void updateSearchResult(){
    setState(() {
      futureFriends=receiveSearchResult(1,searchValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () {
        //         showSearch(context: context, delegate: Search(widget.list));
        //         //Todo 여기서 친구조회 api를 호출해야함.
        //       },
        //       icon: Icon(Icons.search),
        //   )
        // ],
        centerTitle: true,
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: '친구를 검색하세요:)😃',
            fillColor: Colors.white,
          ),
          onSubmitted: (value) {
            print("Submit~!!");
            setState((){
              futureFriends=receiveSearchResult(1,value); // TODO 바꿔야함.
              searchValue=value;
            });

            // Todo 여기서 친구조회 api를 호출해야함.
            // 서버에서 데이터 받아오고
            // setStaete해주고
          },
        ),
      ),
      body: FutureBuilder<List<FriendList>>(
          future: futureFriends,
          builder: (context, snapshot) {
            var data = snapshot.data;
            print("친구야`!~@! 잘 놀았다~!@~!2");
            print(data);
            if (data == null) {
              return Container(
                child: Center(
                  child: Container(),
                ),
              );
            } else {
              print(data);
              return ListView(
                  children: List.generate(
                  data.length,
              (index) => SearchFriendContainer(
                  friendList: snapshot.data![index],
                  onSonChanged: (){
                    updateSearchResult();
                  },
              ),
            ));
            }
          }),
    );
  }
}

Future<List<FriendList>> receiveSearchResult(int userId,String searchString) async {
  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
  );
  Dio dio = Dio(options);
  Response resp = await dio.get('/app/friends/${searchString}/users/${userId}');

  print(resp);
  var data = resp.data;
  print(data['result']);

  final dataResult = data['result'];
  List<FriendList> friendList = [];
  for (int i = 0; i < data['result'].length; i++) {
    friendList.add(FriendList(
      friendId: dataResult[i]['userId'],
      secondId: dataResult[i]['secondId'],
      message: dataResult[i]['statusMessage'],
      friendName: dataResult[i]['userName'],
      profileImage: dataResult[i]['profileImgUrl'],
      levelNum: dataResult[i]['userLevel'],
      level: 'Lv',
      notificationId: dataResult[i]['notificationId']?? 0,
      isFriend: dataResult[i]['isFriend'],
      hasRequest: dataResult[i]['hasRequest'],
      sendRequest: dataResult[i]['sendRequest'],
    ));
  }

  return friendList;
}
// class Search extends SearchDelegate {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//         icon: Icon(Icons.close),
//         onPressed: () {
//           query = "";
//         },)
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }
//
//   late String selectedResult;
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildLeading
//     return Container(
//       child: Center(
//         child: Text(selectedResult),
//       ),
//     );
//   }
//
//   final List<String> listExample = ['Text1', 'Text2', 'Text5'];
//   Search(listExample);
//
//   List<String> recentList = ["Text 4", "Text 3"];
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     List<String> _suggesrtionList = [];
//     query.isEmpty
//         ? _suggesrtionList = recentList
//         : _suggesrtionList
//         .addAll(listExample.where((element) => element.contains(query)));
//
//     return ListView.builder(
//       itemCount: _suggesrtionList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(_suggesrtionList[index]),
//           leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
//           onTap: () {
//             selectedResult = _suggesrtionList[index];
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }

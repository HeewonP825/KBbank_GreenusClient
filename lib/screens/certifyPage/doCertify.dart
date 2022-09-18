//import 'dart:html';

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kbbank_practice/screens/certifyPage/getImageWidget.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionFeed.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionStamp.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/ingMissionData.dart';
import '../challengeDetail/missionStamp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';


import '../../../../theme.dart';

class DoCertify extends StatefulWidget {

  final IngMissionData ingMissionData;
  final int confirmationId;
  const DoCertify(this.ingMissionData,this.confirmationId,{Key? key,}):super(key:key);

  @override
  DoCertifyState createState() => DoCertifyState();
}

class DoCertifyState extends State<DoCertify> {
  List<File> pickedImage=[];


  final ButtonStyle RoundButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xff111421),
    //primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    elevation: 5,
    // shape
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(27.5),
    ),
  );
  void updateFileList(File file){
    setState(() {
      pickedImage.add(file);
      print(pickedImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(
            "GREENUS",
            style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: const Color(0xff111421),//Widget 추가
          onPressed: () { // 이벤트 콜백 함수
            Navigator.pop(
              context,
              // MaterialPageRoute(builder: (context) => MissionStampWidget()),
            );
          },
        ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5,),
          Flexible(
            flex: 1,
            child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),
                    Text(
                      "인증하기",
                      style: TextStyle(
                        fontFamily: 'ELAND',
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.draw,
                      size: 25,
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(160, 15, 0, 10),
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
          Container(
              width: 400,
              child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
          SizedBox(height: 15,),
          Flexible(
            flex: 7,
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 15,),
                    getImageWidget(
                        pickImage:(File file){
                          updateFileList(file);
                        }
                    ),
                    getImageWidget(
                        pickImage:(File file){
                          updateFileList(file);
                        }
                    ),
                  ],
                ),
          ),
          Flexible(
            flex: 7,
            child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 15,),
                    getImageWidget(
                        pickImage:(File file){
                          updateFileList(file);
                        }
                    ),
                    getImageWidget(
                        pickImage:(File file){
                          updateFileList(file);
                        }
                    ),
                  ],
                ),
          ),
          Container(
              width: 400,
              child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
          ElevatedButton(
              style: RoundButtonStyle,
              child: Text('인증하기', style: textTheme().headline2),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false, // 바깥 영역 클릭 시 안닫힘
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('팝업 알림창'),
                        content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('인증하시겠습니까?'),
                              ],
                            )
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('네'),
                            onPressed: () async{
                              for(int i=0; i<pickedImage.length; i++){
                                await uploadImage(pickedImage[i],widget.ingMissionData.groupId,widget.confirmationId);
                              }

                              Navigator.of(context).pop();
                              Navigator.pop(
                                context,
                                MaterialPageRoute(builder: (context) => MissionFeed(widget.ingMissionData)),
                              );
                            },
                          ),
                          FlatButton(
                            child: Text('아니오'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Navigator.pop(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => DoCertify()),
                              // );
                            },
                          ),
                        ],
                      );
                    }
                );
              }
          ),
        ],
      ),
    );
  }
}

// Upload(File imageFile,int groupId,int confirmationId) async {
//   var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   var length = await imageFile.length();
//   final queryParameters={
//     "directory":groupId.toString(),
//   };
//   Map data = {"confirmationId": confirmationId};
//
//   var body = json.encode(data);
//
//   var uri = Uri.https("localhost:3001","/app/group/missionConfirmation/images",queryParameters);
//
//   var request = new http.MultipartRequest("POST", uri);
//   var multipartFile = new http.MultipartFile('file', stream, length,
//       filename: basename(imageFile.path));
//   //contentType: new MediaType('image', 'png'));
//
//   request.files.add(multipartFile);
//   var response = await request.send();
//   print(response.statusCode);
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//   });
// }

uploadImage(File imageFile,int groupId,int confirmationId) async {
  String fileName = imageFile.path.split('/').last;
  FormData formData = FormData.fromMap({
    "image":
    await MultipartFile.fromFile(imageFile.path, filename:fileName),
    "confirmationId":confirmationId,
  });
  var options = BaseOptions(
    baseUrl: 'http://10.0.2.2:3002',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio=Dio(options);
  Response response = await dio.post("/app/group/missionConfirmation/images", data: formData,);

}
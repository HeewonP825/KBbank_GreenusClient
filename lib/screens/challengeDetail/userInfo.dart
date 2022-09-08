import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 100,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: Text("1.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                  ))), //순위
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Container(
              //profileImage
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new Image.network(
                          "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                      .image,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 7,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lv.",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "99  ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "정민욱!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "999",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "1000",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

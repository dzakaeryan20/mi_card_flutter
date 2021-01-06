import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class CircleAvatarWidget extends StatelessWidget {
  bool isChangeavatar = false;

  @override
  Widget build(BuildContext context) {
    var timer = Timer(Duration(seconds: 5), () => {
      isChangeavatar = !isChangeavatar,
      print(isChangeavatar),
    } );

    // TODO: implement build
    return AnimatedCrossFade(
      crossFadeState: !isChangeavatar ? CrossFadeState.showFirst: CrossFadeState.showSecond,
        duration: const Duration(seconds: 5),
        firstChild: CircleAvatar(
            radius: 50.0, backgroundImage: AssetImage('images/dzaka.jpg')
        ),
      secondChild: CircleAvatar(
      radius: 50.0, backgroundImage: AssetImage('images/dname.png')) ,
    );

  }
}




class MyApp extends StatelessWidget {

  Widget TextInfoWidget(String Type, String name, String font, num size,
      FontWeight weight, num letter, Color color) {
    if (Type == "name") {
      return new Text(name,
          style: TextStyle(
            fontFamily: font,
            fontSize: size,
            color: color,
            fontWeight: weight,
          ));
    }
    if (Type == "Jobs") {
      return new Text(name,
          style: TextStyle(
            fontFamily: font,
            fontSize: size,
            color: Colors.white,
            fontWeight: weight,
            letterSpacing: letter,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo.shade200,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatarWidget(),
            TextInfoWidget('name', 'Dzaka Eryan', 'Pacifico', 40.0,
                FontWeight.bold, null, Colors.white),
            TextInfoWidget('Jobs', 'Flutter Developer', 'Source Sans Pro', 20.0,
                FontWeight.bold, 2.5, Colors.teal.shade100),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+62 08889297378',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'dzakaeryan20@gmail.com',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro'),
                  ),
                ))
          ],
        )),
      ),
    );
  }
}

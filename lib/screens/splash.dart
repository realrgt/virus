import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/screens/specialists/list.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpecialistList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Color(0xff7a3b8c),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'vogu',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w900,
                color: Color(0xfff44ea0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                  child: CircularProgressIndicator(
//                    backgroundColor: Color(0xfff44ea0),
                valueColor: new AlwaysStoppedAnimation(Color(0xfff44ea0)),
              )),
            )
          ],
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:vogu/screens/splash.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xfff44ea0),
      ),
      home: Splash(),
    ));

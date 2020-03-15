import 'package:flutter/material.dart';
import 'package:vogu/util/img_assets.dart';

class PurpleWave extends StatefulWidget {
  @override
  _PurpleWaveState createState() => _PurpleWaveState();
}

class _PurpleWaveState extends State<PurpleWave> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      IMG_BOTTOM,
      height: MediaQuery.of(context).size.height * 0.229,
      fit: BoxFit.cover,
    );
  }
}

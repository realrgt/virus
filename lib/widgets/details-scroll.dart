import 'dart:math';

import 'package:flutter/material.dart';

class SpecialistDetailsScoll extends StatefulWidget {
  @override
  _SpecialistDetailsScollState createState() => _SpecialistDetailsScollState();
}

class _SpecialistDetailsScollState extends State<SpecialistDetailsScoll> {
  int _selectedIndex = 0;

  _setColor() {
    Color color;
    int random = Random().nextInt(3);

    switch (random) {
      case 0:
        color = Colors.purple;
        break;
      case 1:
        color = Colors.purpleAccent;
        break;
      default:
        color = Colors.deepPurple;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 50.0),
        children: _imgUrls
            .asMap()
            .entries
            .map(
              (MapEntry map) => _buildCircleImg(map.key),
            )
            .toList(),
      ),
    );
  }

  List<String> _imgUrls = [
    'assets/images/woman.jpg',
    'assets/images/woman1.jpg',
    'assets/images/woman2.jpg',
    'assets/images/woman3.jpg',
    'assets/images/woman1.jpg',
  ];

  Widget _buildCircleImg(int index) {
    Color _color = _setColor();

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print('Selected index: $_selectedIndex');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 85.0,
                  width: 85.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _selectedIndex == index
                        ? Colors.purple
                        : Colors.deepPurple,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.5),
                      image: DecorationImage(
                        image: AssetImage(_imgUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.0),
            _selectedIndex == index
                ? Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.purple,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

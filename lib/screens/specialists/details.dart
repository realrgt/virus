import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/models/specialist.dart';

class SpecialistDetails extends StatefulWidget {
  final Specialist specialist;

  SpecialistDetails({this.specialist});

  @override
  _SpecialistDetailsState createState() => _SpecialistDetailsState();
}

class _SpecialistDetailsState extends State<SpecialistDetails> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Hero(
            tag: widget.specialist.imgUrl,
            child: Image(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              image: AssetImage(widget.specialist.imgUrl),
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40, right: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white70,
                    size: 35.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20.0,
            top: 200,
            child: Row(
              children: <Widget>[
                Text(
                  widget.specialist.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 250.0,
            child: Container(
              height: MediaQuery.of(context).size.height - 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0), // TODO: Adjust this
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1.0)
                    ),
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
                  ),
                ],
              ),
            ),
          )
        ],
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
                      borderRadius: BorderRadius.circular(50), color: _color),
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
                      color: _color,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

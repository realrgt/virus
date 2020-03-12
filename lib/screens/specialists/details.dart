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
                  SizedBox(height: 30.0), // TODO: Remove this
                  Container(
                      height: 150.0,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 50.0),
                        children: <Widget>[
                          imgItem(
                              'assets/images/woman.jpg', Colors.purple, false),
                          imgItem('assets/images/woman1.jpg',
                              Colors.purpleAccent, true),
                          imgItem('assets/images/woman3.jpg', Colors.deepPurple,
                              false),
                          imgItem('assets/images/woman1.jpg',
                              Colors.purpleAccent, false),
                          imgItem('assets/images/woman3.jpg', Colors.deepPurple,
                              false),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imgItem(String imgPath, Color bgColor, bool present) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: bgColor),
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
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          present
              ? Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: bgColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

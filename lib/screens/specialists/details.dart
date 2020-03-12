import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/models/specialist.dart';
import 'package:vogu/widgets/details-scroll.dart';

class SpecialistDetails extends StatefulWidget {
  final Specialist specialist;

  SpecialistDetails({this.specialist});

  @override
  _SpecialistDetailsState createState() => _SpecialistDetailsState();
}

class _SpecialistDetailsState extends State<SpecialistDetails> {


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
                  SpecialistDetailsScoll(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}

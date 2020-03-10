import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialistList extends StatefulWidget {
  @override
  _SpecialistListState createState() => _SpecialistListState();
}

class _SpecialistListState extends State<SpecialistList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // TODO: remove this (All about title)
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  child: Text(
                    'Especialistas sugeridos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.purple,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Luísa Silva',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white70,
                            ),
                            Text(
                              'Matola, Mozambique',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.white70,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white70,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white70,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white70,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.purpleAccent,
                            textColor: Colors.white,
                            child: Text('Ver Mais'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/woman.jpg',
                      height: 160.0,
                      width: 125.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

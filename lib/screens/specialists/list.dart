import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/models/specialist.dart';

import 'details.dart';

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
                  padding: EdgeInsets.only(bottom: 15.0),
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
            Expanded(
              child: ListView.builder(
                itemCount: specialists.length,
                itemBuilder: (context, index) {
                  Specialist specialist = specialists[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SpecialistDetails(
                          specialist: specialist,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    specialist.name,
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
                                      specialist.address,
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
//                              _buildRatingStars(specialist.rating),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: RaisedButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SpecialistDetails(
                                          specialist: specialist,
                                        ),
                                      ),
                                    ),
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
                          top: 10.0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Hero(
                              tag: specialist.imgUrl,
                              child: Image.asset(
                                specialist.imgUrl,
                                height: 160.0,
                                width: 140.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
}

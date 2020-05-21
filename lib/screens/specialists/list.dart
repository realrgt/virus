import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/specialist.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/core/models/service.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/screens/specialists/details.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/cross-icon.dart';

class SpecialistList extends StatefulWidget {
  @override
  _SpecialistListState createState() => _SpecialistListState();
}

class _SpecialistListState extends State<SpecialistList> {
  List<Specialist> specialists;
  List<Specialist> fromServer;
  List<Service> queryList;
  int cont = 0;
  String actualService;
  List<Service> actualList;
  dynamic actualSpecialist;

  @override
  void initState() {
    specialists = List();
    actualList = List();
    actualSpecialist = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///try provider
    final specialistProvider = Provider.of<SpecialistCRUD>(context);
    var taskInfo = Provider.of<Task>(context);
    queryList = taskInfo.services;

    ///try provider

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 120.0),
                child: Text(
                  'Especialistas Sugeridos',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              CrossIcon(color: Colors.black26, paddingRight: 16.0)
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: StreamBuilder(
              stream: specialistProvider.fetchSpecialistsAsStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  fromServer = snapshot.data.documents
                      .map(
                        (doc) => Specialist.fromMap(doc.data, doc.documentID),
                      )
                      .toList();

                  for (var i = 0; i < fromServer.length; i++) {
                    actualSpecialist = fromServer[i];
                    actualList = fromServer[i].services;
                    cont = 0;
                    for (var i = 0; i < actualList.length; i++) {
                      actualService = actualList[i].name;
                      for (var i = 0; i < queryList.length; i++) {
                        if (actualService == queryList[i].name) {
                          cont += 1;
                        }
                      }

                      if (cont == queryList.length) {
                        if (!specialists.contains(actualSpecialist)) {
                          specialists.add(actualSpecialist);
                        }
                      }
                    }
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: specialists.length,
                    itemBuilder: (context, index) {
                      Specialist specialist = specialists[index];
                      return GestureDetector(
                        onTap: () {
                          /// set [specialistId] to task provider
                          taskInfo.specialistId = specialists[index].id;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SpecialistDetails(
                                specialist: specialists[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              height: 160.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: PURPLE_DEEP,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25.0,
                                  vertical: 15.0,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.0,
                                        horizontal: 40.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: PURPLE_ACCENT,
                                      ),
                                      child: Text(
                                        'Ver Mais',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Hero(
                                  tag: specialist.imgUrl,
                                  child: Image.network(
                                    '${specialist.imgUrl}',
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
                  );
                } else {
                  return Center(
                    child: Text(
                      'Fetching data',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
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

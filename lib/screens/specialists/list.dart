import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/specialist.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/screens/specialists/details.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/cross-icon.dart';
import 'package:vogu/widgets/rating-widget.dart';

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
    fromServer = List();
    actualSpecialist = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///try provider
    final specialistProvider = Provider.of<SpecialistCRUD>(context);
    var taskInfo = Provider.of<Task>(context);
    queryList = taskInfo.services;
    setState(() {
      fromServer.clear();
      specialists.clear();
      actualList.clear();
      actualSpecialist = null;
      cont = 0;
    });

    ///try provider

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          specialists.length > 0
              ? Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 120.0),
                      child: Text(
                        'Especialistas Sugeridos',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    CrossIcon(color: Colors.black26, paddingRight: 16.0),
                  ],
                )
              : Container(),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FutureBuilder(
              future: specialistProvider.fetchSpecialists(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // assign firestore documents
                  fromServer = snapshot.data;

                  //filter documents matching selected services
                  // 1st - loop through every firestore documents
                  for (var i = 0; i < fromServer.length; i++) {
                    actualSpecialist = fromServer[i];
                    actualList = fromServer[i].services;
                    cont = 0;
                    // 2nd - loop through each document services list
                    for (var i = 0; i < actualList.length; i++) {
                      actualService = actualList[i].name;
                      // 3rd - loop through each selected service
                      for (var i = 0; i < queryList.length; i++) {
                        if (actualService == queryList[i].name) {
                          // 4th - count same service names into both (selected services list and
                          // current document's services list )
                          cont += 1;
                        }
                      }
                    }
                    // 5th - add current document if it has every selected services
                    if (cont == queryList.length) {
                      specialists.add(actualSpecialist);
                      actualList = fromServer[i].services;
                    }
                  }

                  print('DEBUG ============== ==>');
                  specialists.forEach(print);
                  print(specialists.length);
                  print('DEBUG ============== ==>');

                  if (specialists.length > 0) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: specialists.length,
                      itemBuilder: (context, index) {
                        Specialist specialist = specialists.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            /// set [specialistId] to task provider
                            taskInfo.specialistId =
                                specialists.elementAt(index).id;

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SpecialistDetails(
                                  specialist: specialists.elementAt(index),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          RatingBarIndicator(
                                            rating: specialist.rating,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: Text(
                          'No specialist found for \nprovided services!!',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: SpinKitFadingCircle(
                        color: PURPLE_DEEP,
                        size: 50.0,
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

}

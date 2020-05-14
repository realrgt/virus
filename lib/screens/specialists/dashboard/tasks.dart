import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/task_crud.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/screens/specialists/dashboard/task-location.dart';
import 'package:vogu/util/default_colors.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskCRUD>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    final uid = firebaseUser.uid;
    print(uid);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          StreamBuilder(
            stream: taskProvider.fetchTasksAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                tasks = snapshot.data.documents
                    //  .where((t) => t.documentID == uid)
                    .map(
                      (doc) => Task.fromMap(doc.data, doc.documentID),
                    )
                    .toList();

                if (tasks.length <= 0) {
                  // that specialist has no scheduled tasks yet
                  return Container(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Não encontramos nenhum serviço\n para a sua agenda!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: PURPLE_DEEP.withOpacity(0.5),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 50.0),
                              FlatButton(
                                onPressed: () => Navigator.of(context).pop(),
                                color: PURPLE_DEEP.withOpacity(0.1),
                                splashColor: PURPLE_DEEP,
                                child: Text(
                                  'Voltar',
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 120.0),
                            child: Text(
                              'Próximos serviços',
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                          //  CrossIcon(color: Colors.black26, paddingRight: 16.0)
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          Task task = tasks[index];
                          return GestureDetector(
                            onTap: () => print('You clicked me'),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              height: 123.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.network(
                                            task.imgUrl,
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                task.userName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0,
                                                ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 18.0,
                                                  ),
                                                  SizedBox(width: 10.0),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.47,
                                                    child: Text(
                                                      task.address,
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 3.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.access_time,
                                                        size: 15.0,
                                                      ),
                                                      SizedBox(width: 5.0),
                                                      Text(
                                                        task.time,
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  SizedBox(
                                                    height: 20.0,
                                                    child: RaisedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (_) =>
                                                                TaskLocation(
                                                              imgUrl:
                                                                  task.imgUrl,
                                                              address:
                                                                  task.address,
                                                              month: createMouth(
                                                                  task.date),
                                                              name:
                                                                  task.userName,
                                                              time: task.time,
                                                              latitude:
                                                                  task.latitude,
                                                              longitude: task
                                                                  .longitude,
                                                              day: task.date
                                                                  .substring(
                                                                      0, 2),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      color: Colors.black,
                                                      textColor: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        'Onde fica?',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 10.0,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 80.0,
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: VerticalDivider(
                                            color: Colors.grey[300],
                                            thickness: 1.5,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              task.date.substring(0, 2),
                                              style: TextStyle(
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.w700,
                                                color: PURPLE_DEEP,
                                              ),
                                            ),
                                            Text(
                                              createMouth(task.date),
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                                color: PURPLE_DEEP,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Buscando...',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  String createMouth(String txt) {
    final month = txt.substring(3, 5);

    String builtMonth;

    switch (month) {
      case '01':
        builtMonth = 'JAN';
        break;
      case '02':
        builtMonth = 'FEV';
        break;
      case '03':
        builtMonth = 'MAR';
        break;
      case '04':
        builtMonth = 'ABR';
        break;
      case '05':
        builtMonth = 'MAI';
        break;
      case '06':
        builtMonth = 'JUN';
        break;
      case '07':
        builtMonth = 'JUL';
        break;
      case '08':
        builtMonth = 'AGO';
        break;
      case '09':
        builtMonth = 'SET';
        break;
      case '10':
        builtMonth = 'OUT';
        break;
      case '11':
        builtMonth = 'NOV';
        break;
      default:
        builtMonth = 'DEZ';
        break;
    }
    return builtMonth;
  }
}

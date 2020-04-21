import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/task_crud.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/screens/specialists/dashboard/add-service.dart';
import 'package:vogu/screens/specialists/dashboard/tasks.dart';
import 'package:vogu/util/default_colors.dart';

class ServicesUpdate extends StatefulWidget {
  @override
  _ServicesUpdateState createState() => _ServicesUpdateState();
}

class _ServicesUpdateState extends State<ServicesUpdate> {
  List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskCRUD>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    final uid = firebaseUser.uid;
    print(uid);

    return Scaffold(
      backgroundColor: PURPLE_DEEP,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Column(
            children: <Widget>[
              StreamBuilder(
                stream: taskProvider.fetchTasksAsStream(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    tasks = snapshot.data.documents
//                        .where((t) => t.documentID == uid)
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
                                    'Ainda nao adicionou nenhum servico!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 50.0),
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    color: Colors.grey.withOpacity(0.1),
                                    splashColor: Colors.grey,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 32.0, top: 10.0, right: 32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Atualize \nos preços dos serviços',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => AddService(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: PINK,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: PURPLE_DEEP,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              Task task = tasks[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 120.0,
                                    margin: EdgeInsets.symmetric(vertical: 5.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black45,
                                            offset: Offset(0, 5.0),
                                            blurRadius: 10.0,
                                          )
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Unhas',
                                                style: TextStyle(
                                                  fontSize: 30.0,
                                                  color: PURPLE_DEEP,
                                                ),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Editar',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: PINK,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: PURPLE_ACCENT,
                                                    ),
                                                    onPressed: () =>
                                                        print('You clicked me'),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 50.0,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    'Gel',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'MT',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              right: 25,
                                              top: 6.0,
                                              child: Text(
                                                '150',
                                                style: TextStyle(
                                                  fontSize: 48.0,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              'Concordo que a vogu acresce uma taxa de 25% ao valor cobrado ao cliente em dispesas de marketing e manutenção daplataforma.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 13.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: PURPLE_ACCENT,
                              textColor: Colors.white,
                              child: Center(
                                child: Text('Confirmar'),
                              ),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => Tasks(),
                                ),
                              ),
                            ),
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
            ],
          ),
        ],
      ),
    );
  }
}

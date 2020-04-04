import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/models/specialist.dart';
import 'package:vogu/screens/specialists/dashboard/task-location.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/cross-icon.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 120.0),
                child: Text(
                  'Próximos serviços',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
//              CrossIcon(color: Colors.black26, paddingRight: 16.0)
            ],
          ),
          SizedBox(height: 20.0),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: specialists.length,
            itemBuilder: (context, index) {
              Specialist specialist = specialists[index];
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                specialist.imgUrl,
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    specialist.name,
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
                                      Text(
                                        specialist.address,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.access_time,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            '14:00',
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
                                          onPressed: () =>
                                              Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => TaskLocation(),
                                            ),
                                          ),
                                          color: Colors.black,
                                          textColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            'Onde fica?',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '0${index + 1}',
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w700,
                                    color: PURPLE_DEEP,
                                  ),
                                ),
                                Text(
                                  'AGO',
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
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

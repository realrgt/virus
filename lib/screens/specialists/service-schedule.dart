import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
// ignore: implementation_imports
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:vogu/screens/specialists/list.dart';
import 'package:vogu/widgets/categories-scroll.dart';
import 'package:vogu/widgets/service-chips.dart';

class ServiceSchedule extends StatefulWidget {
  final int temp;

  const ServiceSchedule({Key key, this.temp}) : super(key: key);

  @override
  _ServiceScheduleState createState() => _ServiceScheduleState();
}

class _ServiceScheduleState extends State<ServiceSchedule> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              width: _width,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                  CategoriesScroll(scrollItem: widget.temp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                final datePicked = await showRoundedDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now().subtract(
                                    Duration(days: 1),
                                  ),
                                  lastDate: DateTime.now().add(
                                    Duration(days: 15),
                                  ),
                                  theme: ThemeData(
                                      primarySwatch: Colors.deepPurple),
                                  styleDatePicker:
                                      MaterialRoundedDatePickerStyle(
                                    paddingMonthHeader:
                                        EdgeInsets.only(top: 15.0),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150.0,
                                height: 37.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '08/12/2020',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final timePicked = await showRoundedTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  theme: ThemeData(
                                      primarySwatch: Colors.deepPurple),
                                );
                              },
                              child: Container(
                                width: 150.0,
                                height: 37.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '10:45 AM',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => SpecialistList(),
                                ),
                              ),
                              child: Container(
                                width: 145.0,
                                height: 47.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Confirmar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

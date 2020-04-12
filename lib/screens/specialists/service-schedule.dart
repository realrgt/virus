import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:vogu/screens/specialists/list.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/categories-scroll.dart';
import 'package:vogu/widgets/cross-icon.dart';

class ServiceSchedule extends StatefulWidget {
  @override
  _ServiceScheduleState createState() => _ServiceScheduleState();
}

class _ServiceScheduleState extends State<ServiceSchedule> {

  String _date;
  String _time;

  _formatDate(DateTime date) {
    var formatter = DateFormat('dd/MM/yyyy');
    return _date = formatter.format(date);
  }

  @override
  void initState() {
    _formatDate(DateTime.now());
    _time = TimeOfDay.now().toString().substring(10, 15);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: PURPLE_DEEP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            CrossIcon(paddingRight: 20.0),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Text(
                "Selecione os serviços",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      CategoriesScroll(),
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
                                    final datePicked =
                                        await showRoundedDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(
                                        Duration(days: 1),
                                      ),
                                      lastDate: DateTime.now().add(
                                        Duration(days: 45),
                                      ),
                                      theme: ThemeData(
                                        primarySwatch: Colors.purple,
                                      ),
                                    );

                                    setState(() {
                                      _formatDate(datePicked);
                                    });
                                  },
                                  child: Container(
                                    width: 150.0,
                                    height: 37.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: PURPLE_DEEP,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          _date,
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
                                    final timePicked =
                                        await showRoundedTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      theme: ThemeData(
                                        primarySwatch: Colors.purple,
                                      ),
                                    );

                                    setState(() {
                                      _time = timePicked
                                          .toString()
                                          .substring(10, 15);
                                    });
                                  },
                                  child: Container(
                                    width: 150.0,
                                    height: 37.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: PURPLE_DEEP,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          _time,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: PURPLE_DEEP,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                SizedBox(height: 20.0)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

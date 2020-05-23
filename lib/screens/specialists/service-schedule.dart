import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/models/task.dart';
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
    ///try provider
    var taskInfo = Provider.of<Task>(context);
    var itemCount = 0;

    if (taskInfo.items != null) {
      setState(() {
        itemCount = taskInfo.items.length;
      });
    }

    //set date and time on TaskProvider
    taskInfo.date = _date;
    taskInfo.time = _time;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Container(
            // height: MediaQuery.of(context).size.height * 0.25,
            height: 182,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/pencils.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 40,
                  right: 20,
                  child: Container(
                    height: 30.0,
                    child: CrossIcon(),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    width: MediaQuery.of(context).size.width,
                    height: 38,
                    child: itemCount > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 35.0,
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: PINK,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$itemCount',
                                    style: TextStyle(
                                      color: BLUE,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Serviços selecionados",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "Selecione os serviços",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 182,
            color: Colors.white,
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
                                final datePicked = await showRoundedDatePicker(
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
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                                final timePicked = await showRoundedTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  theme: ThemeData(
                                    primarySwatch: Colors.purple,
                                  ),
                                );

                                setState(() {
                                  _time =
                                      timePicked.toString().substring(10, 15);
                                });
                              },
                              child: Container(
                                width: 150.0,
                                height: 37.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                            InkWell(
                              onTap: () {
                                itemCount > 0
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SpecialistList(),
                                        ),
                                      )
                                    : print('Select a service');
                              },
                              child: Container(
                                width: 145.0,
                                height: 47.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: itemCount > 0
                                      ? PURPLE_DEEP
                                      : PURPLE_DEEP.withOpacity(0.7),
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
                            SizedBox(height: 20.0)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

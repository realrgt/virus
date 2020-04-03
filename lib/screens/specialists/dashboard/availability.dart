import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vogu/screens/specialists/list.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/util/util-date.dart';
import 'package:vogu/widgets/switch-widget.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  bool _isAllDayAvailable = true;
  int _selectedDay = 0;
  var _daysInWeek;
  var _todayWeekday = DateTime.now().weekday;

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.animateTo(100, duration: Duration(milliseconds: 1900), curve: Curves.ease);
    Timer(Duration(seconds: 2), () {
      _scrollController.animateTo(-10, duration: Duration(milliseconds: 1000), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();

    _daysInWeek = Utils.daysInRange(
      Utils.firstDayOfWeek(today),
      Utils.lastDayOfWeek(today),
    ).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: PURPLE_DEEP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Disponível para novos serviços?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SwitchWidget(
                    activeColor: PURPLE_DEEP,
                    isBorder: true,
                    borderColor: Colors.white,
                    borderSize: 1,
                    borderRadius: 5.0,
                    value: _isAllDayAvailable,
                    height: 27.0,
                    onChanged: (value) {
                      print("AllDayAvailable : $value");
                      setState(() {
                        _isAllDayAvailable = value;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Qual é a sua disponibilidade semanal?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 80.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      children: _days
                          .asMap()
                          .entries
                          .map((MapEntry map) => _buildDays(map.key))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 40.0),
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

  Widget _buildDays(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = index;
          print('SelectedDay: $_selectedDay');
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 2.5),
        width: 68,
        decoration: BoxDecoration(
          color: _selectedDay == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: _todayWeekday == index ? Colors.white : Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_days[index]}',
              style: TextStyle(
                fontSize: 18.0,
                color: _selectedDay == index ? PURPLE_DEEP : Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '${Utils.formatDay(_daysInWeek[index])}',
              style: TextStyle(
                fontSize: 22.0,
                color: _selectedDay == index ? PURPLE_DEEP : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _days = ['DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB'];

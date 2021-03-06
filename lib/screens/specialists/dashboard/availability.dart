import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/screens/specialists/dashboard/services-update.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/util/util-date.dart';
import 'package:vogu/widgets/switch-widget.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  bool _isAvailableForWorks = true;
  bool _isAllDayAvailable = false;
  int _selectedDay = 0;
  var _daysInWeek;
  var _todayWeekday = DateTime.now().weekday;

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.animateTo(100,
        duration: Duration(milliseconds: 1900), curve: Curves.ease);
    Timer(Duration(seconds: 2), () {
      _scrollController.animateTo(-10,
          duration: Duration(milliseconds: 1000), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    _selectedTimes = List();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // make weekdays start form 0 -> sunday
    if (_todayWeekday == 7) {
      _todayWeekday = 0;
    }

    DateTime today = DateTime.now();

    _daysInWeek = Utils.daysInRange(
      Utils.firstDayOfWeek(today),
      Utils.lastDayOfWeek(today),
    ).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        color: PURPLE_DEEP,
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
                    value: _isAvailableForWorks,
                    height: 27.0,
                    onChanged: (value) {
                      setState(() {
                        _isAvailableForWorks = value;
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
                      children: Utils.weekdays
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  "Horários",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 36.0,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Align(
                                  alignment: Alignment.center,
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    runSpacing: 10.0,
                                    spacing: 10.0,
                                    children: _times
                                        .asMap()
                                        .entries
                                        .map(
                                          (MapEntry map) =>
                                          _buildTimes(map.key),
                                    )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                CheckboxListTile(
                                  controlAffinity:
                                  ListTileControlAffinity.leading,
                                  value: _isAllDayAvailable,
                                  activeColor: PURPLE_DEEP,
                                  onChanged: (bool val) {
                                    setState(() {
                                      _isAllDayAvailable = val;
                                    });
                                  },
                                  title: Text(
                                    'Estou disponivel todo o dia',
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ServicesUpdate(),
                                    ),
                                  ),
                                  child: Container(
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
        width: 68.0,
        decoration: BoxDecoration(
          color: _selectedDay == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: _todayWeekday == index ? Colors.white : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${Utils.weekdays[index]}',
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

  List<String> _selectedTimes = List(_times.length);
  List<bool> _isSelected = List.generate(_times.length, (i) => false);

  Widget _buildTimes(index) {

    return InkWell(
      onTap: () {
        setState(() {
          _isSelected[index] = !_isSelected[index];

          if (!_selectedTimes.contains(_times[index])) {
            _selectedTimes
                .add(_times[index]);
          } else {
            _selectedTimes.remove(_times[index]);
          }
          _selectedTimes.forEach(print);
        });
      },
      child: Container(
        width: 99.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: _isSelected[index] || _isAllDayAvailable
              ? PURPLE_DEEP.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
            )
          ],
        ),
        child: Center(
          child: Text(
            _times[index],
            style: TextStyle(
              fontSize: 18.0,
              color: _isSelected[index] ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

List<String> _times = [
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
];

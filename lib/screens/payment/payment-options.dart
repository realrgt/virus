import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:vogu/core/contollers/task_crud.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/screens/payment/result.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/purple-wave.dart';
import 'package:vogu/widgets/radio-group.dart';

class PaymentOptions extends StatefulWidget {
  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  double _totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    ///try provider
    final taskInfo = Provider.of<Task>(context);
    _totalAmount = -_totalAmount; // avoid adding totalAmout on rebuild [REPLACE IT]
    taskInfo.services.forEach((s) {
      _totalAmount += s.price;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black26,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          spinnerMode: true,
                          spinnerDuration: 3000,
                          size: 230,
                          customWidths: CustomSliderWidths(
                            handlerSize: 0,
                            progressBarWidth: 10,
                            trackWidth: 8,
                          ),
                          customColors: CustomSliderColors(
                            progressBarColors: [PURPLE_ACCENT, PURPLE_DEEP],
                            hideShadow: true,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90.0,
                        left: 0.0,
                        child: Container(
                          width: 230.0, //used the slider's size value here
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Preço Total:',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$_totalAmount MT',
                                style: TextStyle(
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 17),
                  RadioGroupWidget(),
                  SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          onPressed: () async {
                            await TaskCRUD().addTask(
                              Task(
                                specialistId: taskInfo.specialistId,
                                address: taskInfo.address,
                                latitude: taskInfo.latitude,
                                longitude: taskInfo.longitude,
                                date: taskInfo.date,
                                time: taskInfo.time,
                                userId: taskInfo.userId,
                                userName: taskInfo.userName,
                                services: taskInfo.services,
                              ),
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PaymentResult(),
                              ),
                            );
                          },
                          color: PURPLE_DEEP,
                          textColor: Colors.white,
                          child: Text('Pagar'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
//            SizedBox(height: 25),
            PurpleWave()
          ],
        ),
      ),
    );
  }
}

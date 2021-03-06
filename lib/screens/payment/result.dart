import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/cross-icon.dart';
import 'package:vogu/widgets/purple-wave.dart';

class PaymentResult extends StatefulWidget {
  @override
  _PaymentResultState createState() => _PaymentResultState();
}

class _PaymentResultState extends State<PaymentResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CrossIcon(paddingRight: 20, color: Colors.black38,),
                  ],
                ),
                SizedBox(height: 40.0),
                Stack(
                  children: <Widget>[
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          spinnerMode: true,
                          spinnerDuration: 2000,
                          size: 230,
                          customWidths: CustomSliderWidths(
                              handlerSize: 0,
                              progressBarWidth: 10,
                              trackWidth: 10),
                          customColors: CustomSliderColors(
                              progressBarColor: PURPLE_ACCENT,
                              hideShadow: true,
                              trackColor: PURPLE_ACCENT)),
                    ),
                    Positioned(
                      top: 40.0,
                      left: 40.0,
                      child: Container(
                        width: 150,
                        height: 150,
                        child: FlareActor('assets/flare/check-mark.flr',
                            fit: BoxFit.cover, animation: 'Untitled'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 17.0),
                Text('Serviço Pago'),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.question_answer),
                        label: Text("Ir ao chat"),
                        color: PURPLE_DEEP,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 25.0),
                    SizedBox(
                      width: 150,
                      child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone_in_talk),
                        label: Text("Ligar"),
                        color: PURPLE_DEEP,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 91.0),
              ],
            ),
          ),
          PurpleWave()
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vogu/screens/payment/result.dart';
import 'package:vogu/util/img_assets.dart';
import 'package:vogu/widgets/radio-group.dart';

class PaymentOptions extends StatefulWidget {
  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  double _totalAmount = 3025;

  @override
  Widget build(BuildContext context) {
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
                      Image(
                        image: AssetImage(IMG_SPINNER),
                        height: 240.0,
                      ),
                      Positioned(
                        top: 90.0,
                        left: 45.0,
                        child: Container(
                          child: Column(
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
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PaymentResult(),
                            ),
                          ),
                          color: Colors.deepPurple,
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
            SizedBox(height: 25),
            Image.asset(
              IMG_BOTTOM,
              height: MediaQuery.of(context).size.height * 0.229,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

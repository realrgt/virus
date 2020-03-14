import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/spinner.png'),
                    height: 260.0,
                  ),
                  Positioned(
                    top: 100.0,
                    left: 55.0,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text('Preço Total:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                          Text('$_totalAmount MT', style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold,),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),

            ],
          ),
        ),
      ),
    );
  }
}

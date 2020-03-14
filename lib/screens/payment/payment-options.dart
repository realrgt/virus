import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vogu/util/img_assets.dart';
import 'package:vogu/util/svg_assets.dart';
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
                        image: AssetImage(IMG_SPINNER),
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
                  SizedBox(height: 20),
                  RadioGroupWidget(),
                  SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          onPressed: () => print('Clicked Button'),
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          child: Text('Pagar'),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      SvgPicture.asset(SVG_FIRST, height: MediaQuery.of(context).size.height * 0.2,),
                      SvgPicture.asset(SVG_SECOND, height: MediaQuery.of(context).size.height * 0.2,),
                      SvgPicture.asset(SVG_THIRD, height: MediaQuery.of(context).size.height * 0.2,),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

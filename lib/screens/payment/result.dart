import 'package:flutter/material.dart';
import 'package:vogu/util/img_assets.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(
                        top: 16.0,
                        right: 16.0,
                      ),
                      icon: Icon(
                        Icons.close,
                        color: Colors.black26,
                        size: 30.0,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Image(
                  image: AssetImage(IMG_SUCCESS),
                  height: 240,
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
                        color: Colors.deepPurple,
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
                        icon: Icon(Icons.question_answer),
                        label: Text("Ir ao chat"),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
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
    );
  }
}

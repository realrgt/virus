import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vogu/screens/specialists/dashboard/tasks.dart';
import 'package:vogu/util/default_colors.dart';

class ServicesUpdate extends StatefulWidget {
  @override
  _ServicesUpdateState createState() => _ServicesUpdateState();
}

class _ServicesUpdateState extends State<ServicesUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PURPLE_DEEP,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 10.0),
            child: Text(
              'Atualize',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 2.0, bottom: 20.0),
            child: Text(
              'os preços dos serviços',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Column(
            children: <Widget>[
              _buildServices(1),
              _buildServices(2),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Concordo que a vogu acresce uma taxa de 25% ao valor cobrado ao cliente em dispesas de marketing e manutenção daplataforma.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 13.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: PURPLE_ACCENT,
              textColor: Colors.white,
              child: Text('Confirmar'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Tasks(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildServices(int i) {
    return Container(
      height: 213.0,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 5.0),
              blurRadius: 10.0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Unhas',
            style: TextStyle(
              fontSize: 30.0,
              color: PURPLE_DEEP,
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 50.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Gel',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'MT',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 25,
                top: 6.0,
                child: Text(
                  '150',
                  style: TextStyle(
                    fontSize: 48.0,
                  ),
                ),
              )
            ],
          ),
          Divider(height: 30.0, thickness: 1),
          Stack(
            children: <Widget>[
              Container(
                height: 50.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Limpeza',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'MT',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 25,
                top: 6.0,
                child: Text(
                  '100',
                  style: TextStyle(
                    fontSize: 48.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

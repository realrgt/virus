import 'package:flutter/material.dart';
import 'package:vogu/core/services/auth.dart';
import 'package:vogu/util/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String error = '';

  // text field state
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _isSpecialist = false;

  _register(String email, password, bool isSpecialist) async {

      if( email.isNotEmpty && email.contains("@") ){

        if( password.isNotEmpty && password.length > 6 ){


          return await _auth.registerWithEmailAndPassword(email, password, isSpecialist);


        }else{
          setState(() {
            error = "Preencha a senha! digite mais de 6 caracteres";
          });
        }

      }else{
        setState(() {
          error = "Preencha o E-mail válido";
        });
      }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: textInputDecoration.copyWith(hintText: 'email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passController,
              decoration: textInputDecoration.copyWith(hintText: 'password'),
              obscureText: true,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Cliente',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 28.0,
                  ),
                ),
                Switch(
                  value: _isSpecialist,
                  onChanged: (bool value) {
                    setState(() {
                      _isSpecialist = value;
                      print(_isSpecialist);
                    });
                  },
                ),
                Text(
                  'Especialista',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  _register(_emailController.text, _passController.text, _isSpecialist);
                }),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}

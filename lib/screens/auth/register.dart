import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/core/services/auth.dart';
import 'package:vogu/util/constants.dart';
import 'package:vogu/util/default_colors.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String name = '';
  String email = '';
  String password = '';
  bool _isSpecialist = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: PURPLE_DEEP,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        title: Text('Sign up'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'nome'),
                  validator: (val) => val.isEmpty ? 'Enter a username' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Cliente',
                      style: TextStyle(
                        color: Colors.deepOrange.shade200,
                        fontSize: 22.0,
                      ),
                    ),
                    Switch(
                      value: _isSpecialist,
                      activeColor: Colors.deepOrange,
                      onChanged: (bool value) {
                        setState(() {
                          _isSpecialist = value;
                        });
                      },
                    ),
                    Text(
                      'Especialista',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        dynamic result = await _auth.registerWithEmailAndPassword(name, email, password, _isSpecialist);
                        if(result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
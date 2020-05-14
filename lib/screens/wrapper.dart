import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/client-crud.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/screens/auth/authenticate.dart';
import 'package:vogu/screens/maps/map-screen.dart';
import 'package:vogu/screens/specialists/dashboard/availability.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SpecialistCRUD _specialistCRUD = SpecialistCRUD();

  ClientCRUD _clientCRUD = ClientCRUD();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<FirebaseUser>(context);
    final taskInfo = Provider.of<Task>(context);


    // return either the Home or Authenticate widget
    if (firebaseUser == null) {
      return Authenticate();
    } else {
      firebaseUser.reload();
      print('user: ${firebaseUser.uid}');
      print('user: ${firebaseUser.displayName}');
      // navigate to corresponding screen

      dynamic specialist;
      dynamic client;
      _specialistCRUD.getSpecialistById(firebaseUser.uid).then((user) {
        //todo ==> Change email
        specialist = user.email;
        print('->$specialist');
        if (user.email != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => Availability(),
            ),
          );
        }
      }).catchError((error) {
        print('-->--> ${error.runtimeType}');
      });

      _clientCRUD.getClientById(firebaseUser.uid).then((user) {

        taskInfo.userId = firebaseUser.uid; // assign firebase uid to task user's id
        taskInfo.userName = firebaseUser.displayName; // assign displayName in userProvider

        //todo ==> Change email
        client = user.email;
        print('->$client');

        if (user.email != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => MapScreen(),
            ),
          );
        }
      }).catchError((error) {
        print('-->--> ${error.toString()}');
      });

      // before
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Color(0xff7a3b8c),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'vogu',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Color(0xfff44ea0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    child: CircularProgressIndicator(
//                    backgroundColor: Color(0xfff44ea0),
                      valueColor: new AlwaysStoppedAnimation(Color(0xfff44ea0)),
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
}

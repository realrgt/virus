import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/client-crud.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/client.dart';
import 'package:vogu/core/models/specialist.dart';
import 'package:vogu/screens/auth/authenticate.dart';
import 'package:vogu/screens/maps/map-screen.dart';
import 'package:vogu/screens/specialists/dashboard/availability.dart';

class Wrapper extends StatelessWidget {
  SpecialistCRUD _specialistCRUD = SpecialistCRUD();
  ClientCRUD _clientCRUD = ClientCRUD();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
//    final client = Provider.of<Client>(context);
//    final specialist = Provider.of<Specialist>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      print('user: ${user.uid}');
      // navigate to corresponding screen

      dynamic specialist;
      dynamic client;
      _specialistCRUD.getSpecialistById(user.uid).then((user) {
        //todo ==> Change email
        specialist = user.email;
        print('->$specialist');
        if(user.email != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => Availability(),
            ),
          );
        }
      }).catchError((error) {
        print('-->--> ${error.runtimeType}');
      });

      _clientCRUD.getClientById(user.uid).then((user) {
        //todo ==> Change email
        client = user.email;
        print('->$client');
        if(user.email != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => MapScreen(),
            ),
          );
        }
      }).catchError((error) {
        print('-->--> ${error.toString()}');
      });

      return Container(
        color: Colors.white,
      );
    }
  }
}

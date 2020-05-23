import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/service.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/categories-scroll.dart';

class AddService extends StatefulWidget {
  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  @override
  Widget build(BuildContext context) {

    final servicoProvider = Provider.of<Servico>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
      backgroundColor: PURPLE_DEEP,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 28.0),
            child: Text(
              'Adicionar um serviço',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 360,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
                bottom: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                CategoriesScroll(),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 13.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: PURPLE_ACCENT,
              textColor: Colors.white,
              child: Center(
                child: Text('Confirmar'),
              ),
              onPressed: () async {
                  await SpecialistCRUD().addServices(
                    servicoProvider.services,
                    firebaseUser.uid,
                  );
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

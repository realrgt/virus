import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/service.dart';
import 'package:vogu/core/models/specialist.dart';
import 'package:vogu/screens/specialists/dashboard/add-service.dart';
import 'package:vogu/screens/specialists/dashboard/tasks.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/util/texts.dart';

class ServicesUpdate extends StatefulWidget {
  @override
  _ServicesUpdateState createState() => _ServicesUpdateState();
}

class _ServicesUpdateState extends State<ServicesUpdate> {
  List<Servico> services;
  List<Specialist> specialists;

  String uid;

  @override
  Widget build(BuildContext context) {
    // retrieve specialist services form firestore
    final specialistProvider = Provider.of<SpecialistCRUD>(context);
    // current user section
    final firebaseUser = Provider.of<FirebaseUser>(context);

    // to set the specialists last selected services
    final servicoProvider = Provider.of<Servico>(context);

    final uid = firebaseUser.uid;
    print(uid);

    setState(() {
      this.uid = firebaseUser.uid;
    });

    return Scaffold(
      backgroundColor: PURPLE_DEEP,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Column(
            children: <Widget>[
              StreamBuilder(
                stream: specialistProvider.fetchSpecialistsAsStream(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    specialists = snapshot.data.documents
                        .where((t) => t.documentID == uid)
                        .map(
                          (doc) => Specialist.fromMap(doc.data, doc.documentID),
                        )
                        .toList();

                    // reduce servico data to get only its services array
                    final serviceList =
                        specialists.expand((s) => s.services).toList();
                    // assign last selected services
                    servicoProvider.services = serviceList;

                    if (serviceList.length <= 0) {
                      // that specialist has no scheduled services yet
                      return Container(
                        height: MediaQuery.of(context).size.height - 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Ainda nao adicionou nenhum servico!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 50.0),
                                  FlatButton(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30.0,
                                      vertical: 12.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => AddService(),
                                      ),
                                    ),
                                    color: PURPLE_ACCENT,
                                    splashColor: Colors.grey,
                                    child: Text(
                                      'Adicionar Serviços',
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 32.0, top: 10.0, right: 32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Atualize \nos preços dos serviços',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => AddService(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: PINK,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: PURPLE_DEEP,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: serviceList.length,
                            itemBuilder: (context, index) {
                              var service = serviceList[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 120.0,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25.0,
                                      vertical: 5,
                                    ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                service.category,
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: PURPLE_DEEP,
                                                ),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Editar',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: PINK,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: PURPLE_ACCENT,
                                                    ),
                                                    onPressed: () {
                                                      print('You clicked me');
                                                      _buildEdit(
                                                          context, index);
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 50.0,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    service.name,
                                                    style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: BLUE,
                                                      fontWeight:
                                                          FontWeight.w300,
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
                                                '${service.price}',
                                                style: TextStyle(
                                                  fontSize: 48.0,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              TERMS,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[300],
                              ),
                            ),
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
                              child: Center(
                                child: Text('Confirmar'),
                              ),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => Tasks(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Buscando...',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildEdit(BuildContext context, index) {
    // local variables
    final servicoProvider = Provider.of<Servico>(context, listen: false);
    String _oldPrice = servicoProvider.services[index].price.toString();
    final _priceController = TextEditingController(text: _oldPrice);
    final _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _priceController.selection = TextSelection(
            baseOffset: 0, extentOffset: _priceController.text.length);
      }
    });

    // button configuration
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(
          color: Colors.grey[300],
        ),
      ),
      onPressed: () async {
        servicoProvider.services[index].price =
            double.parse(_priceController.text).toDouble();
        await SpecialistCRUD().editServices(servicoProvider.services, uid);
        Navigator.of(context).pop();
      },
    );

    // AlertDialog Setup
    AlertDialog alert = AlertDialog(
      backgroundColor: PURPLE_DEEP,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      title: Text(
        servicoProvider.services[index].name,
        style: TextStyle(
          color: Colors.grey[300],
        ),
      ),
      content: TextField(
        controller: _priceController,
        focusNode: _focusNode,
        style: TextStyle(color: Colors.grey[300]),
        keyboardType: TextInputType.number,
        cursorColor: PURPLE_ACCENT,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey[300]),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey[300]),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey[300]),
            ),
            hintText: 'Preço',
            hintStyle: TextStyle(color: Colors.grey[400]),
            helperText: 'Digite o preço desejado.',
            helperStyle: TextStyle(color: Colors.white),
            labelText: 'Digite o novo preço',
            labelStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: const Icon(
              Icons.account_balance,
              color: Colors.white,
            ),
            prefixText: ' ',
            suffixText: 'MZN',
            suffixStyle: const TextStyle(color: Colors.white)),
      ),
      actions: [
        okButton,
      ],
    );

    // Dialog show up
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

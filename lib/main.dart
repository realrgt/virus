import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/service-crud.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/contollers/task_crud.dart';
import 'package:vogu/core/models/service.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/core/services/auth.dart';
import 'package:vogu/locator.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/splash.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<SpecialistCRUD>()),
        ChangeNotifierProvider(create: (_) => locator<TaskCRUD>()),
        ChangeNotifierProvider(create: (_) => locator<ServiceCRUD>()),
        ChangeNotifierProvider(create: (_) => Task()),
        ChangeNotifierProvider(create: (_) => Servico()),
        ChangeNotifierProvider(create: (_) => Service()),
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

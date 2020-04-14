import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/locator.dart';
import 'package:vogu/screens/splash.dart';

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
        ChangeNotifierProvider(create: (_) => Task()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color(0xfff44ea0),
        ),
        home: Splash(),
      ),
    );
  }
}

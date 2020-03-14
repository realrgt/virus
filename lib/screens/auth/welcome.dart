import 'package:flutter/material.dart';
import 'package:vogu/screens/auth/login.dart';
import 'package:vogu/screens/auth/register.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xfff44ea0),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0),
            Text(
              'Bem Vindo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pacifico'
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Registe para encontrar as melhores especialistas',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 60),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.purple,
              indicatorWeight: 4.0,
              tabs: <Widget>[
                Tab(
                  child: Text('Entrar'),
                ),
                Tab(
                  child: Text('Registar'),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Login(),
                  Register(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: Text(
                      'Entrar',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Entrar com',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

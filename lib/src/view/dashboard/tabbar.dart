import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Example'),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('Tabs Inside Body',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
            ]),
      ),
    );
  }
}

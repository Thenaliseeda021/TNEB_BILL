import 'package:flutter/material.dart';
import 'Unit.dart';
import 'Reading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'EBBILL CALC',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.ac_unit),
                  text: ("UNIT"),
                ),
                Tab(icon: Icon(Icons.ad_units), text: "READING"),
              ],
            ),
          ),
          body: const SafeArea(
              child: TabBarView(
            children: <Widget>[Unit(), Reading()],
          )),
        ),
      ),
    );
  }
}

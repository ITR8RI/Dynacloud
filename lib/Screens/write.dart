import 'package:flutter/material.dart';
import 'dart:async';
import 'main_screen.dart';
import 'dart:core';
import 'package:dynacloud/supply.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:dynacloud/Screens/main_screen.dart';
import 'package:firebase_database/firebase_database.dart';


class WriteExamples extends StatefulWidget {

  static const String id = 'write_screen';
  @override
  _WriteExamplesState createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  final database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child('dailySpecial');


    return Scaffold(
        appBar: AppBar(
          title: Text('write examples'),
        ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                  children: [
                    ElevatedButton(onPressed: () async {
                      try {
                        await dailySpecialRef
                            .set({'description': 'vanilla', 'price': 600});
                        print('please make it work ');
                      } catch (e){
                        print("you got an error $e");
                      }
                    }, child: Text('heyyy'),)
                  ]
              ),
            )
        )
    );
  }
}

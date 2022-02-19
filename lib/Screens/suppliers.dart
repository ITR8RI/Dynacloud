import 'dart:async';
import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'dart:core';
import 'package:dynacloud/supply.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:dynacloud/Screens/main_screen.dart';
class Suppliers extends StatefulWidget {
  static const String id = 'suppliers_screen';

  @override
  _SuppliersState createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  String displaytext1='Results go here';
  String displaytext2='Results go here';
  final database=FirebaseDatabase.instance.reference();
  late StreamSubscription dailysub1;
  late StreamSubscription dailysub2;
  @override
  void initState(){
    super.initState();
    activatedlisteners();
  }
  void activatedlisteners(){
    dailysub1=database.child("Property Master").child("Property Name").onValue.listen((event) {
      final Object? propertyName=event.snapshot.value;
      setState(() {
        displaytext1='$propertyName';
      });
    });
    dailysub2=database.child("Property Master").child("Manager Name").onValue.listen((event) {
      final Object? propertyManager=event.snapshot.value;
      setState(() {
        displaytext2='$propertyManager';
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(displaytext1),
            Text(displaytext2),
          ],
        ),
      ),
    );
  }
   @override
   void deactivate(){
    super.deactivate();
    dailysub1.cancel();
    dailysub2.cancel();
   }
}

import 'package:dynacloud/Screens/write.dart';
import 'package:dynacloud/Screens/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'suppliers.dart';
import 'package:dynacloud/data.dart';
import 'package:dynacloud/constants.dart';
import 'package:dynacloud/Screens/suppliers.dart';
import 'package:firebase_database/firebase_database.dart';
final _firestore=FirebaseFirestore.instance;
late User LoggedinUser;


class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Data> datalist=[];
  DatabaseReference reference=FirebaseDatabase.instance.ref().child("Property Master");



  final messageTextController=TextEditingController();
  final _auth = FirebaseAuth.instance;
  String displaytext='Results go here';
  final database= FirebaseDatabase.instance.ref();

  String messageText='';

  @override
  void initState() {
    super.initState();
    activatedlisteners();
    getCurrentUser();
    DatabaseReference referenceData=FirebaseDatabase.instance.ref().child("Property Master");

  }

  void activatedlisteners(){
    database.child("Property Master").child("Property Name").onValue.listen((event) {
      final Object? PropertyName=event.snapshot.value;
      setState(() {
        displaytext='$PropertyName';
      });
    });
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser;
      if (user != null){
        LoggedinUser=user;
        print(LoggedinUser.email);
      }}catch(e){
      print(e);
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: const <Widget>[
          Icon(Icons.house, size: 30),
          Icon(Icons.archive, size: 30),
        ],
        onTap: (index) {
          setState(() {
            // _page = 0;
            Navigator.pushNamed(context, MainScreen.id);
          });
          setState(() {
            Navigator.pushNamed(context, addscreen.id);
          });

        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Card(
          margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Container(
            height: 120,
            child: Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0)),
                    child: Center(child: Text(displaytext)),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('️Properties'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}







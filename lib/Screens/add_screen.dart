import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynacloud/Screens/main_screen.dart';

class addscreen extends StatelessWidget {
  static const String id = 'add_screen';
  CollectionReference infos=FirebaseFirestore.instance.collection('info');
  late String textnote1;
  late String textnote2;
  late String textnote3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Properties"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              textnote1= value;
            },
            decoration: InputDecoration(hintText: 'Enter Property Name'),
          ),
          TextField(
            onChanged: (value) async {
              textnote2= value;
            },
            decoration: InputDecoration(hintText: 'Enter Property ID'),
          ),
          TextField(
            onChanged: (value) async {
              textnote3= value;
            },
            decoration: InputDecoration(hintText: 'Enter Property Location'),
          ),
          ElevatedButton(
            onPressed: (){
              showDialog(context: context, builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                content: Text('Are you sure you want to submit the information?'),
                actions: [
                  TextButton(onPressed: () async{
                    await infos.add({'Property Name':textnote1,'Property ID':textnote2,'Property Location':textnote3}).then((value) => print('Information added'));
                    Navigator.pushNamed(context, MainScreen.id);
                  }, child: Text('Yes')),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('No')),
                ],
              ));
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

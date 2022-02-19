import 'package:flutter/material.dart';
class Supply{
   String propertyname='';
   String managername='';
  Supply({required this.managername,required this.propertyname});

  factory Supply.fromRTDB(Map<String, dynamic> data){
    return Supply(managername: data['Manager Name'] ?? 'somebody',
        propertyname: data['Property Name'] ?? 'what');
  }
  String fancydescription(){
    return 'The Property Name is $propertyname and Property Manager is $managername';
  }
}
import 'package:dynacloud/Screens/suppliers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dynacloud/Screens/welcome_screen.dart';
import 'package:dynacloud/Screens/registration_screen.dart';
import 'package:dynacloud/Screens/add_screen.dart';
import 'package:dynacloud/Screens/login_screen.dart';
import 'package:dynacloud/Screens/main_screen.dart';
import 'package:dynacloud/Screens/suppliers.dart';
import 'package:dynacloud/Screens/write.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(dynachat());
}

class dynachat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MainScreen.id: (context) => MainScreen(),
        Suppliers.id: (context) => Suppliers(),
        WriteExamples.id: (context) => WriteExamples(),
        addscreen.id: (context) => addscreen(),
      },
    );
  }
}
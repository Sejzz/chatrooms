import 'package:chatrooms/pages/home.dart';
import 'package:chatrooms/pages/splash.dart';
import 'package:chatrooms/pages/username.dart';
import 'package:chatrooms/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: myroutes.splash,
      routes: {
        myroutes.splash:(context) => splash(username: '',),
          myroutes.username:(context) => usernamepage(username: '',),
            myroutes.home:(context) => home(),

      },
    
    );
  }
}


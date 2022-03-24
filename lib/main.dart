import 'package:flutter/material.dart';
import 'package:flutter_invite_code_demo/pages/InviteCodePage.dart';
import 'package:flutter_invite_code_demo/pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: InviteCodePage(),
    );
  }
}

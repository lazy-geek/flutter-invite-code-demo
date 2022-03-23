import 'package:flutter/material.dart';
import 'package:flutter_invite_code_demo/pages/InviteCodePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: InviteCodePage(),
    );
  }
}

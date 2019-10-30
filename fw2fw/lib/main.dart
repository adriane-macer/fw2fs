import 'package:flutter/material.dart';
import 'package:fw2fw/pages/intro.dart';

void main() => runApp(AgreecultureApp());

class AgreecultureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agreeculture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
      ),
      home: Intro(),
    );
  }
}

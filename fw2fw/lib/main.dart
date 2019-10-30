import 'package:flutter/material.dart';
import 'package:fw2fw/pages/intro.dart';

void main() => runApp(FW2FS());

class FW2FS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food waste to food security',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Intro(),
    );
  }
}

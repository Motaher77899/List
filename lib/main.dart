import 'package:flutter/material.dart';
import 'package:list/ListScreen.dart';
import 'package:list/TabBar.dart';
import 'package:list/field.dart';
import 'package:list/exam.dart';
import 'package:list/widget/Own_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Tabbar(),
    );
  }
}

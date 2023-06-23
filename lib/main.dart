import 'package:dodo/category/plumbing.dart';
import 'package:dodo/category/plumbinglist/sink_basin.dart';
import 'package:dodo/home_page.dart';
import 'package:dodo/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DodoBooker',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: Plumbing(),
      
    );
  }
}
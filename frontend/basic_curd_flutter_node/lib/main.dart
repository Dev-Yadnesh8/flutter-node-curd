import 'package:basic_curd_flutter_node/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Curd with nodejs ',
      theme: ThemeData(),
      home: const HomeScreen()
    );
  }
}


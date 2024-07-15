import 'package:basic_curd_flutter_node/screens/home/main_screen/home_screen.dart';
import 'package:basic_curd_flutter_node/theme/theme.dart';
import 'package:basic_curd_flutter_node/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Curd with nodejs ',
      theme: darkMode,
    
      home: const HomeScreen()
    
    );
  }
}


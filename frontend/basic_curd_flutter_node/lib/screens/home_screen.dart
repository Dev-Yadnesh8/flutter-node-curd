import 'package:basic_curd_flutter_node/screens/add_user.dart';
import 'package:basic_curd_flutter_node/screens/components/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Nodejs"),
      ),
      body: const Column(
        children: [
          UserCard(),

        ],
      ),
      floatingActionButton: FloatingActionButton(
          
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserScreen(),));
      },child: const Icon(Icons.add),),
    );
  }
}
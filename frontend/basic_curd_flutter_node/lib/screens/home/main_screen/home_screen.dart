import 'package:basic_curd_flutter_node/screens/home/add_user/add_user.dart';
import 'package:basic_curd_flutter_node/screens/components/user_card.dart';
import 'package:basic_curd_flutter_node/screens/home/main_screen/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

CrudBloc crudBloc = CrudBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CrudBloc,CrudState>(
      bloc:crudBloc ,
      listenWhen: (previous, current) =>current is CrudActionState ,
      buildWhen: (previous, current)=> current is !CrudActionState,
      builder: (context, state) {
        return  Scaffold(
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
          crudBloc.add(AddUserButtonClickEvent());
        //Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserScreen(),));
      },child: const Icon(Icons.add),),
    );
      }, 
      listener: (context, state) {
        if(state is AddUserNavActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen(),));
        }
      },);
  }
}
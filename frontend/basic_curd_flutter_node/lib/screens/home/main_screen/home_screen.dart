import 'package:basic_curd_flutter_node/screens/home/add_user/add_user.dart';
import 'package:basic_curd_flutter_node/screens/components/user_card.dart';
import 'package:basic_curd_flutter_node/screens/home/main_screen/bloc/crud_bloc.dart';
import 'package:basic_curd_flutter_node/screens/home/models/user_model.dart';
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
    return BlocConsumer<CrudBloc, CrudState>(
      bloc: crudBloc,
      listenWhen: (previous, current) => current is CrudActionState,
      buildWhen: (previous, current) => current is !CrudActionState,
      builder: (context, state) {
        if (state is CrudInitialState) {
          crudBloc.add(FetchUserInitialEvent());
        } else if (state is CrudLoadingState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter Nodejs"),
            ),
            body: const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            )),
          );
        } else if (state is CrudLoadedState) {
          final loadedState = state;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter Nodejs"),
            ),
            body: ListView.builder(
              itemCount: loadedState.userData.length,
              itemBuilder: (context, index) {
                UserModel data = loadedState.userData[index];
                return  UserCard(impPath: data.url.toString(), name: data.name.toString(), email: data.email.toString(),onDeleteTap: () {
                  crudBloc.add(DeleteUserOptionClickEvent(userId: data.sId.toString()));
                  Navigator.pop(context);

                },);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                crudBloc.add(AddUserButtonClickEvent());
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserScreen(),));
              },
              child: const Icon(Icons.add),
            ),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is AddUserNavActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddUserScreen(),
              ));
        }
      },
    );
  }
}

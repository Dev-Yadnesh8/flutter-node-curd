import 'package:basic_curd_flutter_node/helpers/flash_messages/flash_messages.dart';
import 'package:basic_curd_flutter_node/screens/home/add_user/bloc/add_user_bloc.dart';
import 'package:basic_curd_flutter_node/screens/home/main_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/ui_helper.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final UiHelper uiHelper = UiHelper();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();

  AddUserBloc addUserBloc = AddUserBloc();

  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUserBloc,AddUserState>(
      bloc: addUserBloc,
      buildWhen: (previous, current) => current is !AddUserActionState ,
      listenWhen: (previous, current) => current is AddUserActionState ,
      builder: (context, state) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Add a User"),
        leading: IconButton(onPressed: () {
          addUserBloc.add(BackButtonClickEvent());
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey,
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      uiHelper.dynamicTextFormField(
                        labelText: "Name",
                        hintText: "Enter your name here..",
                        prefixIcon: Icons.person,
                        controller: nameController,
                      ),
                      const SizedBox(height: 20),
                      uiHelper.dynamicTextFormField(
                        labelText: "Email",
                        hintText: "Enter your email here..",
                        prefixIcon: Icons.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      uiHelper.dynamicTextFormField(

                        labelText: "Photo URL",
                        hintText: "Enter your photo URL here..",
                        prefixIcon: Icons.link,
                        controller: photoUrlController,
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 20),
                      if(state is AddUserLoadingState) const CircularProgressIndicator(color: Colors.blue,),
                      if(state is AddUserInitialState) ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                          elevation: const WidgetStatePropertyAll(0),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        
                          )),
                        onPressed: () {
                          addUserBloc.add(SubmitClickEvent(userData: {
                            'name' : nameController.text,
                            'email' : emailController.text,
                            'profileUrl' : photoUrlController.text,
                          }));
                        },
                         child: const Text("Submit",style: TextStyle(color: Colors.white),))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
      },
       listener: (context, state) {
          if(state is BackButtonClickNavState){
        Navigator.pop(context);
        }else if(state is AddUserLoadedState){
          FlashMessages.successMsg(context: context, successTitle: 'Success', successDesc: 'User created Successfully');
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }else if(state is AddUserErrorState){
          FlashMessages.errorMsg(context: context, errorTitle: 'Ohh Snapp', errorDesc: state.errorMessage);
        }
       },);
  }
}



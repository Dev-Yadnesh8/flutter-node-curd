import 'package:basic_curd_flutter_node/helpers/flash_messages/flash_messages.dart';
import 'package:basic_curd_flutter_node/screens/home/main_screen/home_screen.dart';
import 'package:basic_curd_flutter_node/screens/home/models/user_model.dart';
import 'package:basic_curd_flutter_node/screens/home/update_user/bloc/update_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/ui_helper.dart';

class UpdateUserScreen extends StatefulWidget {
  final UserModel userData ;
  const UpdateUserScreen({super.key, required this.userData});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final UiHelper uiHelper = UiHelper();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();



  GlobalKey formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = widget.userData.name.toString();
     emailController.text = widget.userData.email.toString();
      photoUrlController.text = widget.userData.url.toString();
    super.initState();
  }

UpdateUserBloc updateUserBloc = UpdateUserBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserBloc,UpdateUserState>(
      
      bloc: updateUserBloc,
      listenWhen: (previous, current) => current is UpdateUserActionState,
      buildWhen: (previous, current) =>current is !UpdateUserActionState,
      builder: (context, state) {
       return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Add a User"),
        leading: IconButton(onPressed: () {
          updateUserBloc.add(BackButtonClickEvent());
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            elevation: 2,
            shadowColor: Colors.white,
            color: Colors.grey.shade800,
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
                      if(state is UpdateUserLoadingState) const CircularProgressIndicator(color: Colors.blue,),
                      if(state is UpdateUserInitialState)ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                          elevation: const WidgetStatePropertyAll(0),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        
                          )),
                        onPressed: () {
                          updateUserBloc.add(SubmitClickEvent(userData: {
                            'name' : nameController.text,
                            'email' : emailController.text,
                            'profileUrl' : photoUrlController.text,
                          }, userId: widget.userData.sId.toString()));
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
      if(state is BackButtonClickedState){
        Navigator.pop(context); 
      }else if(state is UpdateUserLoadedState){
        FlashMessages.successMsg(context: context, successTitle: 'Edit Success', successDesc: 'User data edited successfully');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),),(Route<dynamic> route) => false,);
      }else if(state is UpdateUserErrorState){
        FlashMessages.errorMsg(context: context, errorTitle: 'Ohh Snapp!!!', errorDesc: state.errorMessage);
      }
  
    

    },);
   
  }
}
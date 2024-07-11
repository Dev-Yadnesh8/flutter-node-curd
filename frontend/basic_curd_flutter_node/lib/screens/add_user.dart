import 'package:flutter/material.dart';

import '../helpers/ui_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a User"),
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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                        elevation: const WidgetStatePropertyAll(0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      
                        )),
                      onPressed: () {
                        // api call here for adding user 
                      },
                       child: const Text("Submit",style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
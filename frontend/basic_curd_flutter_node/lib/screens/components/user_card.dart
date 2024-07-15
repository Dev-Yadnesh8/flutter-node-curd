import 'package:basic_curd_flutter_node/theme/theme.dart';
import 'package:basic_curd_flutter_node/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final String impPath;
  final String name;
  final String email;
  void Function()? onEditTap;
  void Function()? onDeleteTap;
  
   UserCard({super.key, required this.impPath, required this.name, required this.email,this.onEditTap,this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(impPath,fit: BoxFit.cover,)),
              ),
            )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style:  TextStyle(
                                color: theme == darkMode ? Colors.black: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                           Text(
                            email,
                            style:
                                 TextStyle(color:theme == darkMode ? Colors.black : Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: onEditTap,
                                child: const Text(
                                  'Edit User',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14,fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Delete User'),
                                      content: const Text(
                                          'Are you sure you want to delete this user?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel',style: TextStyle(color: Colors.blue),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          onPressed: onDeleteTap,
                                          child: const Text('Delete',
                                              style:
                                                  TextStyle(color: Colors.red))
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Delete User',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14,fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

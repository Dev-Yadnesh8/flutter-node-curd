import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String impPath;
  final String name;
  final String email;
  void Function()? onEditTap;
  void Function()? onDeleteTap;
  
   UserCard({super.key, required this.impPath, required this.name, required this.email,this.onEditTap,this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(impPath)),
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
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                           Text(
                            email,
                            style:
                                const TextStyle(color: Colors.black45, fontSize: 14),
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
                                      color: Colors.black45, fontSize: 14),
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
                                          child: const Text('Cancel'),
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
                                    TextStyle(color: Colors.red, fontSize: 14),
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

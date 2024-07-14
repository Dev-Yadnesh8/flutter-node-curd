import 'dart:convert';

import 'package:basic_curd_flutter_node/helpers/api_helper/api_helper.dart';
import 'package:basic_curd_flutter_node/screens/home/models/user_model.dart';

class UserCrudRepo{

ApiHelper apiHelper = ApiHelper();

static const baseUrl = 'http://localhost:3000';

Future<List<UserModel>> fetchUsers() async {
  final res = await apiHelper.get('$baseUrl/read');
  if (res.statusCode == 200) {
    List<dynamic> userData = res.data['userData'];
    // Convert the list of dynamic data to List<UserModel>
    List<UserModel> users = userData.map((user) => UserModel.fromJson(user)).toList();
    return users;
  } else {
    print('Error with ${res.statusCode}');
    // Handle the error as needed
    throw Exception('Failed to load users');
  }
}

Future<void> createUser(Map<String, dynamic> userData) async {
  final header = {'Content-Type': 'application/json; charset=UTF-8'};

  final res = await apiHelper.post("$baseUrl/create", headers: header, body: userData);
  if (res.statusCode == 200) {
    print('Success to create user');
    print('Server response-- ${res.data}');
  } else {
    print('error-create-user-with ${res.statusCode}');
    throw Exception('Failed to create user: ${res.statusCode}');
  }
}


Future<void> editUser(Map<String, dynamic> userData, String userID) async {
  final header = {'Content-Type': 'application/json; charset=UTF-8'};

  final res = await apiHelper.post('$baseUrl/update/$userID', headers: header, body: jsonEncode(userData));
  if (res.statusCode == 200) {
    print('Success to edit users');
  } else {
    print('Error editing user with status code: ${res.statusCode}');
  }
}



Future<void> deleteUser(String userId)async{
 final res = await apiHelper.delete('$baseUrl/delete/$userId');
 if(res.statusCode == 200){
  print('Success to delete users');
 }else{
  print('error-delete-user-with ${res.statusCode}');
 }
}



}
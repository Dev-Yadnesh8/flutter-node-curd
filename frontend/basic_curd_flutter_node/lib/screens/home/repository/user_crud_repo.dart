import 'package:basic_curd_flutter_node/helpers/api_helper/api_helper.dart';

class UserCrudRepo{

ApiHelper apiHelper = ApiHelper();

static const baseUrl = 'http://localhost:3000';

void fetchUser()async{
 final res =  await apiHelper.get('$baseUrl/read');
 if(res.statusCode == 200){
  print('Success to get users');
  print('Server response - ${res.data}');
 }else{
  print('error-with ${res.statusCode}');
 }
}
Future<void> createUser(Map<String,dynamic> userData)async{
  final  header = {'Content-Type': 'application/json; charset=UTF-8',};

 final res = await apiHelper.post("$baseUrl/create",headers: header, body:userData);
 if(res.statusCode == 200){
  print('Success to creat user');
  print('Server response-- ${res.data}');
 }else{
  print('error-creat-user-with ${res.statusCode}');
 }
}

void editUser()async{
 final res = await apiHelper.put('');
 if(res.statusCode == 200){
  print('Success to edit users');
 }else{
  print('error-edit-user-with ${res.statusCode}');
 }
}


void deleteUser()async{
 final res = await apiHelper.delete('');
 if(res.statusCode == 200){
  print('Success to delete users');
 }else{
  print('error-delete-user-with ${res.statusCode}');
 }
}



}
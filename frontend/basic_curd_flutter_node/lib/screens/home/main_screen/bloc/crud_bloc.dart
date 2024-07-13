import 'dart:async';

import 'package:basic_curd_flutter_node/screens/home/repository/user_crud_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  UserCrudRepo userCrudRepo = UserCrudRepo();
  CrudBloc() : super(CrudInitialState()) {
    on<AddUserButtonClickEvent>(addUserButtonClickEvent);
    on<DeleteUserOptionClickEvent>(deleteUserOptionClickEvent);
    on<EditUserOptionClickEvent>(editUserOptionClickEvent);
    on<FetchUserInitialEvent>(fetchUserInitialEvent);
  }

  FutureOr<void> addUserButtonClickEvent(AddUserButtonClickEvent event, Emitter<CrudState> emit) {
    emit(AddUserNavActionState());
  }

  FutureOr<void> deleteUserOptionClickEvent(DeleteUserOptionClickEvent event, Emitter<CrudState> emit) async{
    emit(CrudLoadingState());
    try {
     await userCrudRepo.deleteUser(event.userId);
      List<UserModel> users =  await userCrudRepo.fetchUsers();
     emit(CrudLoadedState(userData: users));
    // emit(CrudInitialState());
    } catch (e) {
      emit(CrudErrorState());
    }
  }

  FutureOr<void> editUserOptionClickEvent(EditUserOptionClickEvent event, Emitter<CrudState> emit) {
    print("edit Clicked");
  }


  FutureOr<void> fetchUserInitialEvent(FetchUserInitialEvent event, Emitter<CrudState> emit)async {
    emit(CrudLoadingState());
    try{
    List<UserModel> users =  await userCrudRepo.fetchUsers();
     emit(CrudLoadedState(userData: users));
    }catch(e){
      emit(CrudErrorState());
      }
  }
}


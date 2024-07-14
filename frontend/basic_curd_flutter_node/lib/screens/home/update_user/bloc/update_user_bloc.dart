import 'dart:async';

import 'package:basic_curd_flutter_node/screens/home/models/user_model.dart';
import 'package:basic_curd_flutter_node/screens/home/repository/user_crud_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  UserCrudRepo curdRepo = UserCrudRepo();
  UpdateUserBloc() : super(UpdateUserInitialState()) {
   on<SubmitClickEvent>(submitClickEvent);
   on<BackButtonClickEvent>(backButtonClickEvent);
  }

  FutureOr<void> submitClickEvent(SubmitClickEvent event, Emitter<UpdateUserState> emit) async{
    emit(UpdateUserLoadingState());
    try {
     await curdRepo.editUser(event.userData,event.userId);
     emit(UpdateUserLoadedState());
    
      
    } catch (e) {
      emit(UpdateUserErrorState(errorMessage: e.toString()));
      await Future.delayed(Duration(seconds: 2));
      emit(UpdateUserInitialState());
    }
  }


  FutureOr<void> backButtonClickEvent(BackButtonClickEvent event, Emitter<UpdateUserState> emit) {
    emit(BackButtonClickedState());
  }
}

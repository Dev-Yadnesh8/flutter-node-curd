
import 'dart:async';
import 'package:basic_curd_flutter_node/screens/home/repository/user_crud_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  UserCrudRepo repo = UserCrudRepo();
  AddUserBloc() : super(AddUserInitialState()) {
    on<SubmitClickEvent>(submitClickEvent);
    on<BackButtonClickEvent>(backButtonClickEvent);
  }
  
 
  Future<FutureOr<void>> submitClickEvent(SubmitClickEvent event, Emitter<AddUserState> emit) async {
    emit(AddUserLoadingState());
     print("Add User Cliked");
     print("User data- ${event.userData}");
     try {
      await repo.createUser(event.userData);
      emit(AddUserLoadedState());
     } catch (e) {
       emit(AddUserErrorState(errorMessage: e.toString()));
       await Future.delayed(Duration(seconds: 1));
       emit(AddUserInitialState());
     }

  }

  FutureOr<void> backButtonClickEvent(BackButtonClickEvent event, Emitter<AddUserState> emit) {
    print("Back  Button Press");
    emit(BackButtonClickNavState());
  }
}

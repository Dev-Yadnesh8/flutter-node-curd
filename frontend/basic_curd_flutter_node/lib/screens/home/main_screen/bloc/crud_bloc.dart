import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitialState()) {
    on<AddUserButtonClickEvent>(addUserButtonClickEvent);
    on<DeleteUserOptionClickEvent>(deleteUserOptionClickEvent);
    on<EditUserOptionClickEvent>(editUserOptionClickEvent);
  }

  FutureOr<void> addUserButtonClickEvent(AddUserButtonClickEvent event, Emitter<CrudState> emit) {
    emit(AddUserNavActionState());

print("Add Clicked");
  }

  FutureOr<void> deleteUserOptionClickEvent(DeleteUserOptionClickEvent event, Emitter<CrudState> emit) {
    print("delete Clicked");
  }

  FutureOr<void> editUserOptionClickEvent(EditUserOptionClickEvent event, Emitter<CrudState> emit) {
    print("edit Clicked");
  }

}


part of 'add_user_bloc.dart';

@immutable
sealed class AddUserState {}
sealed class AddUserActionState extends  AddUserState {}

class AddUserInitialState extends AddUserState {}
class AddUserLoadingState extends AddUserState {}

class AddUserLoadedState extends AddUserActionState {}
class AddUserErrorState extends AddUserActionState {
  final String errorMessage;

  AddUserErrorState({required this.errorMessage});
}

class BackButtonClickNavState  extends AddUserActionState{}
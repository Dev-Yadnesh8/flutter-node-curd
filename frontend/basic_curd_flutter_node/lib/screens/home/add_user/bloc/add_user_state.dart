part of 'add_user_bloc.dart';

@immutable
sealed class AddUserState {}
sealed class AddUserActionState extends  AddUserState {}

class AddUserInitialState extends AddUserState {}
class AddUserLoadingState extends AddUserState {}
class AddUserLoadedState extends AddUserState {}
class AddUserErrorState extends AddUserState {}

class BackButtonClickNavState  extends AddUserActionState{}
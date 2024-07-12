part of 'crud_bloc.dart';

@immutable
sealed class CrudState {}
sealed class CrudActionState extends CrudState {}

final class CrudInitialState extends CrudState {}

final class CrudLoadingState extends CrudState {}

final class CrudLoadedState extends CrudState {
  final List<UserModel> userData;

  CrudLoadedState({required this.userData});
}

final class CrudErrorState extends CrudState {}

final class AddUserNavActionState extends CrudActionState {}

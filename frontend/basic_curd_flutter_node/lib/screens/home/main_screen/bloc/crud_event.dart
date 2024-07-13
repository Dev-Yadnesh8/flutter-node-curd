part of 'crud_bloc.dart';

@immutable
sealed class CrudEvent {}

class AddUserButtonClickEvent extends CrudEvent {}
class DeleteUserOptionClickEvent extends CrudEvent {
  final String userId;

  DeleteUserOptionClickEvent({required this.userId});
}
class EditUserOptionClickEvent extends CrudEvent {
  final String userId;

  EditUserOptionClickEvent({required this.userId});
}

class FetchUserInitialEvent extends CrudEvent {}
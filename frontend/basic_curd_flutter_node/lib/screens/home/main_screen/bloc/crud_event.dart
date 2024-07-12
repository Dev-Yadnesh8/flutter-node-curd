part of 'crud_bloc.dart';

@immutable
sealed class CrudEvent {}

class AddUserButtonClickEvent extends CrudEvent {}
class DeleteUserOptionClickEvent extends CrudEvent {}
class EditUserOptionClickEvent extends CrudEvent {}

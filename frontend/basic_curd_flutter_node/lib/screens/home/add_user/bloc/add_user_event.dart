part of 'add_user_bloc.dart';

@immutable
sealed class AddUserEvent {}

class SubmitClickEvent extends AddUserEvent{
  final Map<String,dynamic> userData;

  SubmitClickEvent({required this.userData});
}

class BackButtonClickEvent extends AddUserEvent{}
part of 'update_user_bloc.dart';

@immutable
sealed class UpdateUserEvent {}

class SubmitClickEvent extends UpdateUserEvent{
  final Map<String,dynamic> userData;
  final String userId;

  SubmitClickEvent({required this.userData,required this.userId});
}
class BackButtonClickEvent extends UpdateUserEvent{}

part of 'update_user_bloc.dart';

@immutable
sealed class UpdateUserState {}
sealed class UpdateUserActionState extends UpdateUserState {}

final class UpdateUserInitialState extends UpdateUserState {}
final class UpdateUserLoadingState extends UpdateUserState {}

final class UpdateUserLoadedState extends UpdateUserActionState {}
final class UpdateUserErrorState extends UpdateUserActionState {
  final String errorMessage;

  UpdateUserErrorState({required this.errorMessage});
}

final class BackButtonClickedState extends UpdateUserActionState {}
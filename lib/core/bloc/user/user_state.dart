part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {}

final class UserLoadedState extends UserState {
  final List<User> users;

  const UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

final class UserErrorState extends UserState {
  final String error;
  const UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}

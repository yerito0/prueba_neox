part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

//Estado Inicial
final class UserInitialState extends UserState {}

//Estado para cuando termina de cargar los usuarios desde API
final class UserLoadedState extends UserState {
  final List<User> users;

  const UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

//Estado para indicar que hubo error en la carga de datos
final class UserErrorState extends UserState {
  final String error;
  const UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}

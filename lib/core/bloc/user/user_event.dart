part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

//Evento para carga inicial
class LoadUserEvent extends UserEvent {}

//Evento para seleccionar usuario
class SelectedUserEvent extends UserEvent {
  final User user;
  const SelectedUserEvent(this.user);
  @override
  List<Object> get props => [user];
}

//Evento para eliminar usuario del listado
class DeleteUserEvent extends UserEvent {
  final User user;
  const DeleteUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

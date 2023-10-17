part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {}

class SelectedUserEvent extends UserEvent {
  final User user;
  const SelectedUserEvent(this.user);
  @override
  List<Object> get props => [user];
}

class DeleteUserEvent extends UserEvent {
  final User user;
  const DeleteUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

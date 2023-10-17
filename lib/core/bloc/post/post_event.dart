part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadUserPostEvent extends PostEvent {
  final int id;
  const LoadUserPostEvent({required this.id});
  @override
  List<Object> get props => [id];
}

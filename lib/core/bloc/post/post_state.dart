part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitialState extends PostState {}

final class PostLoadedState extends PostState {
  final List<Post> posts;
  const PostLoadedState(this.posts);
  @override
  List<Object> get props => [posts];
}

final class PostErrorState extends PostState {
  final String error;
  const PostErrorState(this.error);
  @override
  List<Object> get props => [error];
}

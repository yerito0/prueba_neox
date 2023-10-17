import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/post_model.dart';
import '../../repositories/user_service_repository.dart';
import '../../services/api.dart';
import '../../services/user_service_impl.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UserServiceRepository _userRepository = UserServiceImpl(api: API());

  PostBloc() : super(PostInitialState()) {
    on<LoadUserPostEvent>((event, emit) async {
      try {
        List<Post> userPosts = await _userRepository.getPosts(id: event.id);
        emit(PostLoadedState(userPosts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}

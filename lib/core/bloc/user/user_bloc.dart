import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../models/user_model.dart';
import '../../repositories/user_service_repository.dart';
import '../../services/api.dart';
import '../../services/user_service_impl.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserServiceRepository _userRepository = UserServiceImpl(api: API());

  User? _selectedUser;
  User? get selectedUser => _selectedUser;

  UserBloc() : super(UserInitialState()) {
    on<LoadUserEvent>((event, emit) async {
      try {
        List<User> users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });

    on<SelectedUserEvent>((event, emit) {
      if (state is UserLoadedState) {
        _selectedUser = event.user;
      }
    });

    on<DeleteUserEvent>((event, emit) {
      if (state is UserLoadedState) {
        final state = this.state as UserLoadedState;
        emit(
          UserLoadedState(
            List.from(state.users)..remove(event.user),
          ),
        );
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bloc/user/user_bloc.dart';

class UserBlocScreen extends StatelessWidget {
  const UserBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserBloc()..add(LoadUserEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UserScreen'),
        ),
        body: Center(child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitialState) {
              return const CircularProgressIndicator();
            }
            if (state is UserLoadedState) {
              return Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.users.length,
                      itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            context
                                .read<UserBloc>()
                                .add(SelectedUserEvent(state.users[index]));
                            context.goNamed(
                              'details',
                              extra: state.users[index],
                            );
                          },
                          leading: const Icon(Icons.person),
                          title: Text(state.users[index].name),
                          trailing: IconButton(
                            onPressed: () {
                              context
                                  .read<UserBloc>()
                                  .add(DeleteUserEvent(state.users[index]));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ))),
                ],
              );
            }
            return const Text('Algo salio mal');
          },
        )),
      ),
    );
  }
}

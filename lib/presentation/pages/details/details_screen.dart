import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_neox/presentation/widgets/user_card_widget.dart';
import 'package:prueba_neox/presentation/widgets/user_post_widget.dart';

import '../../../../core/bloc/post/post_bloc.dart';
import '../../../../core/models/user_model.dart';

class DetailsBlocScreen extends StatelessWidget {
  const DetailsBlocScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostBloc()
            ..add(
              LoadUserPostEvent(
                id: user.id,
              ),
            ),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserCardWidget(user: user),
                Center(
                  child: BlocBuilder<PostBloc, PostState>(
                      builder: (context, state) {
                    if (state is PostInitialState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is PostLoadedState) {
                      final items = state.posts;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UserPostWidget(
                              name: user.name,
                              post: items[index],
                              lastPost: (items.length - 1) == index),
                        ),
                      );
                    }
                    return const Text('algo salio mal');
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

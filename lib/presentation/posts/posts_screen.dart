import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/models/posts_model.dart';

import '../../core/widgets/cards.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();

    return BlocBuilder<PostsCubit, PostsStates>(builder: (context, state) {
      if (state is PostsLoadingState && state.isFirstFetch) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      List<PostModel>? posts = BlocProvider.of<PostsCubit>(context).posts;

      bool isLoading = false;
      if (state is PostsLoadingState) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is PostsLoadedState) {
        posts = state.posts;
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Posts List',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Cards(
          scrollController: scrollController,
          posts: posts!,
          isLoading: isLoading,
          withNavigator: true,
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/models/posts_comments_model.dart';

import '../../core/widgets/cards.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class PostCommentsScreen extends StatelessWidget {
  PostCommentsScreen({Key? key,required this.postsBody,required this.postsId})
      : super(key: key);
  final postsBody;
  final postsId;
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadComments();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadComments();

    return BlocBuilder<PostsCubit, PostsStates>(builder: (context, state) {
      if (state is PostsCommentsLoadingState && state.isFirstFetchComment) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      List<PostsCommentsModel> posts = [];

      bool isLoading = false;
      if (state is PostsCommentsLoadingState) {
        posts = state.oldPostsComments;
        isLoading = true;
      } else if (state is PostsCommentsLoadedState) {
        posts = state.postsLoadedComments;
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Posts Comments',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  child: ListTile(
                leading: Text(
                  'id:$postsId',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  'body:$postsBody',
                  style: const TextStyle(fontSize: 16),
                ),
              )),
              const Divider(),
              const Text('Comments'),
              Cards(
                  scrollController: scrollController,
                  posts: posts,
                  isLoading: isLoading),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/models/posts_comments_model.dart';
import 'package:konax_task/models/posts_model.dart';
import 'package:konax_task/presentation/cubit/states.dart';

import '../../repositories/repositories.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit(this.repositories) : super(PostsInitalState());
  static PostsCubit get(context) => BlocProvider.of(context);
  int page = 1;
  List<PostModel>? postModel;
  List<PostModel>? posts;

  final PostsRepositories repositories;
  void loadPosts() {
    if (state is PostsLoadingState) return;
    final currentState = state;

    var oldPosts = <PostModel>[];

    if (currentState is PostsLoadedState) {
      oldPosts = currentState.posts;
    }
    emit(PostsLoadingState(oldPosts, isFirstFetch: page == 1));

    repositories.fetchPosts(page).then((newPosts) {
      page++;
      posts = (state as PostsLoadingState).oldPosts;
      posts?.addAll(newPosts);
      emit(PostsLoadedState(posts!));
    });
  }

  int pagecomments = 1;

  void loadComments() {
    if (state is PostsCommentsLoadingState) return;
    final currentState = state;

    var oldPostsComments = <PostsCommentsModel>[];

    if (currentState is PostsCommentsLoadedState) {
      oldPostsComments = currentState.postsLoadedComments;
    }
    emit(PostsCommentsLoadingState(oldPostsComments,
        isFirstFetchComment: pagecomments == 1));

    repositories.fetchPostsComments(pagecomments).then((newPostsComments) {
      pagecomments++;

      final posts = (state as PostsCommentsLoadingState).oldPostsComments;
      posts.addAll(newPostsComments);
      emit(PostsCommentsLoadingState(posts));
    });
  }
}

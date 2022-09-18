import 'package:konax_task/models/posts_comments_model.dart';
import 'package:konax_task/models/posts_details_model.dart';
import 'package:konax_task/models/posts_model.dart';

abstract class PostsStates {}

class PostsInitalState extends PostsStates {}

class PostsLoadedState extends PostsStates {
  final List<PostModel> posts;

  PostsLoadedState(this.posts);
}

class PostsLoadingState extends PostsStates {
  final List<PostModel> oldPosts;
  final bool isFirstFetch;
  PostsLoadingState(this.oldPosts, {this.isFirstFetch = false});
}

class PostsErrorState extends PostsStates {
  final String error;
  PostsErrorState(this.error);
}

//Comments
class PostsCommentsLoadingState extends PostsStates {
  final List<PostsCommentsModel> oldPostsComments;
  final bool isFirstFetchComment;
  PostsCommentsLoadingState(this.oldPostsComments,
      {this.isFirstFetchComment = false});
}

class PostsCommentsErrorState extends PostsStates {
  final String error;
  PostsCommentsErrorState(this.error);
}

class PostsCommentsLoadedState extends PostsStates {
  final List<PostsCommentsModel> postsLoadedComments;

  PostsCommentsLoadedState(this.postsLoadedComments);
}

//Details

class PostsDetailsLoadingState extends PostsStates {
  final List<PostsDetailsModel> oldPostsDetails;
  final bool isFirstFetchDetails;
  PostsDetailsLoadingState(this.oldPostsDetails,
      {this.isFirstFetchDetails = false});
}

class PostsDetailsErrorState extends PostsStates {
  final String error;
  PostsDetailsErrorState(this.error);
}

class PostsDetailsLoadedState extends PostsStates {
  final List<PostsDetailsModel> postsLoadedDetails;

  PostsDetailsLoadedState(this.postsLoadedDetails);
}

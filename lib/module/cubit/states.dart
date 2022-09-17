abstract class PostsStates {}

class PostsInitalState extends PostsStates {}

class PostsLoadingState extends PostsStates {}

class PostsSuccessState extends PostsStates {}

class PostsErrorState extends PostsStates {
  final String error;
  PostsErrorState(this.error);
}

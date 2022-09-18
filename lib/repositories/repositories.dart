import 'package:konax_task/core/network/remote/http_helper.dart';
import 'package:konax_task/models/posts_comments_model.dart';
import 'package:konax_task/models/posts_model.dart';

class PostsRepositories {
  PostsRepositories(HttpHelper httpHelper);

  Future<List<PostModel>> fetchPosts(int page) async {
    final posts = await HttpHelper.fetchPosts(page);
    return posts.map((e) => PostModel.fromJson(e)).toList();
  }
  
   Future<List<PostsCommentsModel>> fetchPostsComments(int page) async {
    final postsComments = await HttpHelper.fetchPostsComments(page);
    return postsComments.map((e) => PostsCommentsModel.fromJson(e)).toList();
  }
}

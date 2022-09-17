import 'dart:convert';

List<PostsCommentsModel> postsCommentsModelFromJson(String str) =>
    List<PostsCommentsModel>.from(
        json.decode(str).map((x) => PostsCommentsModel.fromJson(x)));

class PostsCommentsModel {
  PostsCommentsModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory PostsCommentsModel.fromJson(Map<String, dynamic> json) =>
      PostsCommentsModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}

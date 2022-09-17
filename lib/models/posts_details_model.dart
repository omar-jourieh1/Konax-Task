
import 'dart:convert';

PostsDetailsModel postsDetailsModelFromJson(String str) =>
    PostsDetailsModel.fromJson(json.decode(str));

class PostsDetailsModel {
  PostsDetailsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostsDetailsModel.fromJson(Map<String, dynamic> json) =>
      PostsDetailsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}

import 'package:flutter/material.dart';

import '../../presentation/posts/posts_comments_screen.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.scrollController,
    required this.posts,
    required this.isLoading,
    this.withNavigator = false,
    this.onTap,
  }) : super(key: key);

  final ScrollController scrollController;
  final List posts;
  final bool isLoading;
  final void Function()? onTap;
  final bool withNavigator;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          if (index < posts.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: withNavigator
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => PostCommentsScreen(
                                  postsId: posts[index].id,
                                  postsBody: posts[index].body,
                                )));
                      }
                    : onTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                        child: ListTile(
                      leading: Text(
                        'id:${posts[index].id}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'body:${posts[index].body}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )),
                  ],
                ),
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
        separatorBuilder: ((context, index) =>
            Divider(color: Colors.grey[300])),
        itemCount: posts.length + (isLoading ? 1 : 0));
  }
}

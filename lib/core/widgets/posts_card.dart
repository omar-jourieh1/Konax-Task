import 'package:flutter/material.dart';

import '../../module/cubit/cubit.dart';
import '../../module/posts/posts_details_screen.dart';

class PostsCard extends StatelessWidget {
  PostsCard({
    Key? key,
    this.onTap,
    required this.withNavigator,
    required this.cubit,
  }) : super(key: key);
  void Function()? onTap;
  bool withNavigator = false;
  final PostsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: withNavigator
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => PostDetailsScreen(
                                  index: index,
                                )));
                      }
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'id:${cubit.postsModel![index].id}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'title:${cubit.postsModel![index].title}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'body:${cubit.postsModel![index].body}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )),
        separatorBuilder: ((context, index) =>
            Divider(color: Colors.grey[300])),
        itemCount: cubit.postsModel!.length);
  }
}

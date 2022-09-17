import 'package:flutter/material.dart';

import '../../module/cubit/cubit.dart';

class PostCommentsCard extends StatelessWidget {
  const PostCommentsCard({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final PostsCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'id:${cubit.postsCommentsModel![index].id}',
                  ),
                  Text(
                    'body:${cubit.postsCommentsModel![index].name}',
                  ),
                  Text(
                    'title:${cubit.postsCommentsModel![index].email}',
                  ),
                  Text(
                    'body:${cubit.postsCommentsModel![index].body}',
                  ),
                ],
              ),
            )),
        itemCount: cubit.postsCommentsModel!.length,
        separatorBuilder: (context, index) => const Divider());
  }
}

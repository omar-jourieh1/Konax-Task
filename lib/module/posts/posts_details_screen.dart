import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/core/widgets/post_comments_card.dart';
import 'package:konax_task/module/cubit/cubit.dart';
import 'package:konax_task/module/cubit/states.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    var cubit = PostsCubit.get(context);
    return BlocConsumer<PostsCubit, PostsStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Posts Details ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: cubit.postsModel == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'id:${cubit.postsDetailsModel![index].id}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'title:${cubit.postsDetailsModel![index].title}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'body:${cubit.postsDetailsModel![index].body}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Divider(
                          height: 20,
                        ),
                        const Text(
                          'Comments',
                          style: TextStyle(fontSize: 24),
                        ),
                        cubit.postsCommentsModel == null
                            ? const Center(child: CircularProgressIndicator())
                            : PostCommentsCard(
                                cubit: cubit,
                                index: index,
                              )
                      ],
                    ),
                  ),
          );
        });
  }
}

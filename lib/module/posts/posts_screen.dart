import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/module/cubit/cubit.dart';
import 'package:konax_task/module/cubit/states.dart';

import '../../core/widgets/posts_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<PostsCubit, PostsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = PostsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Posts List',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: cubit.postsModel == null
                ? const Center(child: CircularProgressIndicator())
                : PostsCard(
                    cubit: cubit,
                    withNavigator: true,
                  ));
      });
}

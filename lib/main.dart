import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/core/network/remote/dio_helper.dart';
import 'package:konax_task/module/cubit/cubit.dart';
import 'package:konax_task/module/cubit/states.dart';
import 'package:konax_task/module/posts/posts_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => PostsCubit()
                ..getPostListData()
                ..getPostDetailsData()
                ..getPostComments())
        ],
        child: BlocConsumer<PostsCubit, PostsStates>(
            listener: (context, state) {},
            builder: (context, state) => MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const PostsScreen())));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/core/network/remote/http_helper.dart';
import 'package:konax_task/presentation/cubit/cubit.dart';
import 'package:konax_task/presentation/posts/posts_screen.dart';
import 'package:konax_task/repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    repositories: PostsRepositories(HttpHelper()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.repositories}) : super(key: key);
  final PostsRepositories repositories;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
            create: (context) => PostsCubit(repositories),
            child: MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: PostsScreen())));
  }
}

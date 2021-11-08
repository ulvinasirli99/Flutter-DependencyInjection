import 'package:dependency_inject_fl/cubit/post_cubit.dart';
import 'package:dependency_inject_fl/locator/d_inject.dart';
import 'package:dependency_inject_fl/repository/post_repo.dart';
import 'package:dependency_inject_fl/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final locatorInjection = DInjetction();
  locatorInjection.setupLocator();
  PostRepository postRepository = PostRepository();
  runApp(
    BlocProvider(
      create: (context) => PostCubit(postRepository: postRepository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

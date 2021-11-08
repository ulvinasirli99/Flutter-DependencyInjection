import 'package:dependency_inject_fl/cubit/post_cubit.dart';
import 'package:dependency_inject_fl/locator/d_inject.dart';
import 'package:dependency_inject_fl/model/post_model.dart';
import 'package:dependency_inject_fl/repository/post_repo.dart';
import 'package:dependency_inject_fl/widgets/custom_post_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostRepository repository;
  late PostCubit postCubit;
  @override
  void initState() {
    super.initState();
    repository = PostRepository();
    postCubit = locator.get<PostCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<PostModel?>?>(
        stream: postCubit.postStream,
        builder: (context, AsyncSnapshot<List<PostModel?>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : " + snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (ctx, index) {
                return CustomPostWidget(
                  id: snapshot.data![index]!.id.toString(),
                  title: snapshot.data![index]!.title.toString(),
                  colorIndex: (index % 20),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

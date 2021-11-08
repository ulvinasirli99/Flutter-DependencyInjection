import 'package:dependency_inject_fl/api/post_api.dart';
import 'package:dependency_inject_fl/cubit/post_cubit.dart';
import 'package:dependency_inject_fl/repository/post_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

PostRepository postRepository = PostRepository();

class DInjetction {
  
  void setupLocator() {
  
    locator.registerLazySingleton<PostCubit>(
  
      () => PostCubit(
  
        postRepository: postRepository,
  
      ),
  
    );
  
    locator.registerLazySingleton<PostApi>(
  
      () => PostApi(),
  
    );
  
    locator.registerLazySingleton<PostRepository>(
  
      () => PostRepository(),
  
    );
  
  }

}
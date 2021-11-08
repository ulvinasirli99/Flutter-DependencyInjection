import 'package:dependency_inject_fl/api/post_api.dart';
import 'package:dependency_inject_fl/model/post_model.dart';

class PostRepository {
 
  PostApi postApi = PostApi();

  Future<List<PostModel?>?> fetchPostData() async {

    List<PostModel?>? postList = [];

    postList = await postApi.getInitialPostData();
 
    return postList;
 
  }

}

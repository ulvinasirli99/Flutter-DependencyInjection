import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dependency_inject_fl/model/post_model.dart';
import 'package:dependency_inject_fl/repository/post_repo.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  
  PostCubit({required this.postRepository}) : super(PostInitial()) {
  
    fetchPostDataCubit();
  
  }

  final PostRepository postRepository;

  List<PostModel?>? posts = [];
  
  final postStreamController = StreamController<List<PostModel?>?>();

  Stream<List<PostModel?>?> get postStream => postStreamController.stream;

  void fetchPostDataCubit() async {
  
    try {
  
      emit(PostLoading());

      posts = await postRepository.fetchPostData();

      postStreamController.sink.add(posts);

      emit(PostLoaded(posts));
  
    } catch (e) {
  
      emit(PostError(e.toString()));
  
    }
  
  }

}

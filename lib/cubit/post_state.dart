part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {

  final List<PostModel?>? getCubitPostData;

  PostLoaded(this.getCubitPostData);

}

class PostError extends PostState {

  final String errorMsg;

  PostError(this.errorMsg);

}

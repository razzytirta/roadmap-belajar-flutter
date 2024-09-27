import 'package:bloc/bloc.dart';
import 'package:infinite_list_with_bloc_54/model/post.dart';

// Define events
abstract class PostEvent {}

class LoadPosts extends PostEvent {}

// Define states
abstract class PostState {}

class PostUninitialized extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({this.posts = const [], this.hasReachedMax = false});

  PostLoaded copyWith({List<Post>? posts, bool? hasReachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}

// Define the BLoC
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostUninitialized()) {
    on<LoadPosts>((event, emit) async {
      if (state is PostUninitialized) {
        emit(PostLoading());
        try {
          final posts = await Post.connectToAPI(0, 10);
          emit(PostLoaded(posts: posts, hasReachedMax: false));
        } catch (e) {
          emit(PostError("Failed to fetch posts: ${e.toString()}"));
        }
      } else if (state is PostLoaded) {
        final postLoaded = state as PostLoaded;
        if (postLoaded.hasReachedMax) return;

        try {
          final posts = await Post.connectToAPI(postLoaded.posts.length, 10);
          emit(posts.isEmpty
              ? postLoaded.copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: postLoaded.posts + posts,
                  hasReachedMax: false,
                ));
        } catch (e) {
          emit(PostError("Failed to fetch more posts: ${e.toString()}"));
        }
      }
    });
  }
}

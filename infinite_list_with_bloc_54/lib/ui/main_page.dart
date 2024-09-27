import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_with_bloc_54/bloc/post_bloc.dart';
import 'package:infinite_list_with_bloc_54/ui/post_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _controller = ScrollController();
  late PostBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<PostBloc>(context);
    _controller.addListener(_onScroll);
    // Initial loading of posts
    _bloc.add(LoadPosts());
  }

  void _onScroll() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      // Check if we are already loading posts to prevent multiple calls
      if (_bloc.state is! PostLoading &&
          !(_bloc.state is PostLoaded &&
              (_bloc.state as PostLoaded).hasReachedMax)) {
        _bloc.add(LoadPosts());
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Infinite List with BLoC',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostUninitialized) {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is PostLoading) {
              return ListView.builder(
                controller: _controller,
                itemCount: 1, // Show only loading indicator
                itemBuilder: (context, index) => const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (state is PostLoaded) {
              return ListView.builder(
                controller: _controller,
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.posts.length) {
                    return PostItem(state.posts[index]);
                  } else {
                    return const Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            } else if (state is PostError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const SizedBox(); // Handle any unanticipated states
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:infinite_list_with_bloc_54/model/post.dart';

class PostItem extends StatelessWidget {
  final Post? post;
  const PostItem(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${post!.id}"),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${post!.title}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(),
                Text("${post!.body}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

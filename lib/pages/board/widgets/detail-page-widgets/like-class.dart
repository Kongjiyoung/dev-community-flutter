import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'like-manager.dart';
import 'like.dart';

class LikeClass extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(likeManagerProvider);
    final likeManagerNotifier = ref.read(likeManagerProvider.notifier);

    return Row(
      children: [
        Like(
          isLiked ? Icons.favorite : Icons.favorite_border,
          30,
          isLiked ? Colors.red : Colors.black,
          onTap: () {
            likeManagerNotifier.toggleLike();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  isLiked ? '좋아요를 취소하였습니다.' : '좋아요 하였습니다.',
                ),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
        SizedBox(width: 5),
        Text("2"),
      ],
    );
  }
}

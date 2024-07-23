import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodal/board_detail_viewmodel.dart';

class LikeClass extends ConsumerWidget {
  final BoardDetailViewModel viewmodel;
  final bool isLiked;
  final int likeCount;
  final int boardId;

  LikeClass(this.viewmodel, this.isLiked, this.likeCount, this.boardId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            if (isLiked) {
              viewmodel.likeDelete(boardId);
            } else {
              viewmodel.likeSave(boardId);
            }
          },
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            size:  30,
            color: isLiked ? Colors.red : Colors.black,
          ),
        ),
        SizedBox(width: 5),
        Text("$likeCount"),
      ],
    );
  }
}

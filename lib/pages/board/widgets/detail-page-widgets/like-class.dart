import 'package:flutter/material.dart';
import 'like.dart';
import 'like-manager.dart';

class LikeClass extends StatefulWidget {
  final LikeManager likeManager;

  LikeClass({required this.likeManager});

  @override
  _LikeClass createState() => _LikeClass();
}

class _LikeClass extends State<LikeClass> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Like(
          widget.likeManager.isLiked ? Icons.favorite : Icons.favorite_border,
          30,
          widget.likeManager.isLiked ? Colors.red : Colors.black,
          onTap: () {
            setState(() {
              widget.likeManager.toggleLike();
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  widget.likeManager.isLiked ? '좋아요 하였습니다.' : '좋아요를 취소하였습니다.',
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

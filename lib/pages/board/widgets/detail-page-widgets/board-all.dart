import 'package:dev_community/dtos/board/board_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board.dart';
import 'bookmark-manager.dart';
import 'like-manager.dart';
import 'profile.dart';

class BoardAll extends ConsumerWidget {
  final String title;
  final String? content;
  final String name;
  final String profileImg;
  final List<ReplyDTO> replies;
  final quill.QuillController _quillController;
  final int boardHit;
  final String createdAt;
  final int replyCount;

  BoardAll({
    required this.title,
    required this.content,
    required this.name,
    required this.profileImg,
    required this.replies,
    required this.createdAt,
    required this.replyCount,
    required this.boardHit,
    required quill.QuillController quillController,
  }) : _quillController = quillController;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkManager = ref.watch(bookmarkManagerProvider.notifier);
    final likeManager = ref.watch(likeManagerProvider.notifier);

    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Profile(
                  content: content,
                  name: name,
                  profileImg: profileImg,
                ),
                Board(
                  replies: replies,
                  title: title,
                  quillController: _quillController,
                  likeManager: likeManager,
                  createdAt: createdAt,
                  replyCount: replyCount,
                  boardHit: boardHit,
                ),
                SizedBox(height: 50), // 댓글 입력창 높이만큼의 여백 추가
              ],
            ),
          ],
        ),
      ),
    );
  }
}

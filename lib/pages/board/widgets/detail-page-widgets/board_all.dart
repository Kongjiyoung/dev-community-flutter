import 'package:dev_community/dtos/board/board_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board.dart';
import '../../../../dtos/bookmark/bookmark_manager.dart';
import '../../../../dtos/like/like_manager.dart';
import 'profile.dart';

class BoardAll extends ConsumerWidget {
  final int boardId;
  final String title;
  final String? content;
  final String name;
  final String profileImg;
  final List<ReplyDTO> replies;
  final List<BoardImagesDTO> images;
  final quill.QuillController _quillController;
  final int boardHit;
  final String createdAt;
  final int replyCount;
  final bool isBookMark;

  const BoardAll({
    super.key,
    required this.boardId,
    required this.title,
    required this.content,
    required this.name,
    required this.profileImg,
    required this.replies,
    required this.images,
    required this.createdAt,
    required this.replyCount,
    required this.boardHit,
    required this.isBookMark,
    required quill.QuillController quillController,
  }) : _quillController = quillController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final likeManager = ref.watch(likeManagerProvider.notifier);

    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Profile(
                  boardId: boardId,
                  content: content,
                  name: name,
                  profileImg: profileImg,
                  isBookMark: isBookMark,
                ),
                Board(
                  replies: replies,
                  title: title,
                  quillController: _quillController,
                  likeManager: likeManager,
                  createdAt: createdAt,
                  images: images,
                  replyCount: replyCount,
                  boardHit: boardHit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

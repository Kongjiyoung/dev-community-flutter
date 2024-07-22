import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/pages/board/viewmodal/board_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board.dart';
import '../../../../dtos/like/like_manager.dart';
import 'profile.dart';

class BoardAll extends ConsumerWidget {
  final BoardDetailDTO boardDetailDTO;
  final BoardDetailViewModel viewmodel;
  final quill.QuillController _quillController;

  const BoardAll(  {
    required this.viewmodel,
    required this.boardDetailDTO,
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
                  boardId: boardDetailDTO.boardId,
                  content: boardDetailDTO.userPosition,
                  name: boardDetailDTO.userNickname,
                  profileImg: boardDetailDTO.userImage,
                  isBookMark: boardDetailDTO.myBookmark,
                  viewmodel: viewmodel,
                ),
                Board(
                  replies: boardDetailDTO.replies,
                  title: boardDetailDTO.boardTitle,
                  quillController: _quillController,
                  likeManager: likeManager,
                  createdAt: boardDetailDTO.boardCreatedAtDuration,
                  images: boardDetailDTO.images,
                  replyCount: boardDetailDTO.replyCount,
                  boardHit: boardDetailDTO.boardHit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

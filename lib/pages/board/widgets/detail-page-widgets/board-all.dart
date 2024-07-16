import 'package:dev_community/pages/board/widgets/detail-page-widgets/bookmark-manager.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/like-manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'board.dart';
import 'profile.dart';

class BoardAll extends StatelessWidget {
  BoardAll({
    super.key,
    required this.bookmarkManager,
    required this.title,
    required quill.QuillController quillController,

  }) : _quillController = quillController;

  final BookmarkManager bookmarkManager;
  final String title;
  final quill.QuillController _quillController;
  final LikeManager likeManager = LikeManager(); // 좋아요 상태 관리 객체

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Profile(
                  bookmarkManager: bookmarkManager,
                  content: "사용자 1번 입니다.",
                  name: "하승진",
                  profileImg: "assets/images/kakao_button.png",
                ),
                Board(
                  title: title,
                  quillController: _quillController,
                  likeManager: likeManager,
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

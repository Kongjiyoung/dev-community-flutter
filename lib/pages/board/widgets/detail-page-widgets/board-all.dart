import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board.dart';
import 'bookmark-manager.dart';
import 'like-manager.dart';
import 'profile.dart';


class BoardAll extends ConsumerWidget {
  BoardAll({
    super.key,
    required this.title,
    required quill.QuillController quillController,
  }) : _quillController = quillController;

  final String title;
  final quill.QuillController _quillController;

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

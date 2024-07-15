import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply-all.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'content.dart';
import 'like-manager.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.title,
    required quill.QuillController quillController,
    required this.likeManager,
  }) : _quillController = quillController;

  final String title;
  final quill.QuillController _quillController;
  final LikeManager likeManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            MyTitle(title: title),
            Content(quillController: _quillController, likeManager: likeManager),
            ReplyAll(),
          ],
        ),
      ),
    );
  }
}

import 'package:dev_community/pages/board/widgets/detail-page-widgets/board-imgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'like-class.dart';
import 'like-manager.dart';

class Content2 extends StatelessWidget {
  final quill.QuillController _quillController;
  final LikeManager likeManager;

  const Content2({
    required quill.QuillController quillController,
    required this.likeManager,
  }) : _quillController = quillController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        quill.QuillEditor(
          configurations: quill.QuillEditorConfigurations(
            controller: _quillController,
            customStyles: quill.DefaultStyles(),
          ),
          focusNode: FocusNode(),
          scrollController: ScrollController(),
        ),
        SizedBox(height: 10),
        BoardImgs(3, "assets/images/profile.jpeg"),
        SizedBox(height: 10),
        LikeClass(),
        SizedBox(height: 10),
      ],
    );
  }
}


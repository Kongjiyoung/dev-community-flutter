import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'like-class.dart';
import 'like-manager.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required quill.QuillController quillController,
    required this.likeManager,
  }) : _quillController = quillController;

  final quill.QuillController _quillController;
  final LikeManager likeManager;

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
        LikeClass(likeManager: likeManager),
        SizedBox(height: 10),
      ],
    );
  }
}
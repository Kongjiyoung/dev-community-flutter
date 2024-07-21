import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/board_imgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'like_class.dart';
import '../../../../dtos/like/like_manager.dart';

class Content2 extends StatelessWidget {
  final quill.QuillController _quillController;
  final List<BoardImagesDTO> images;
  final LikeManager likeManager;

  const Content2({
    required quill.QuillController quillController,
    required this.likeManager,
    required this.images,
  }) : _quillController = quillController;

  @override
  Widget build(BuildContext context) {
    if (images.length == 0) {
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
          LikeClass(),
          SizedBox(height: 10),
        ],
      );
    } else {
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
          BoardImgs(images.length, images),
          SizedBox(height: 10),
          LikeClass(),
          SizedBox(height: 10),
        ],
      );
    }
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class BoardContent2 extends StatelessWidget {
  const BoardContent2({
    super.key,
    required this.quillController,
    required ScrollController editorScrollController,
    required FocusNode editorFocusNode,
  }) : _editorScrollController = editorScrollController, _editorFocusNode = editorFocusNode;

  final quill.QuillController quillController;
  final ScrollController _editorScrollController;
  final FocusNode _editorFocusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: quill.QuillEditor(
          configurations: quill.QuillEditorConfigurations(
            controller: quillController,
            customStyles: quill.DefaultStyles(
              paragraph: quill.DefaultTextBlockStyle(
                TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                const quill.VerticalSpacing(0, 0),
                const quill.VerticalSpacing(0, 0),
                null,
              ),
            ),
          ),
          scrollController: _editorScrollController,
          focusNode: _editorFocusNode,
        ),
      ),
    );
  }
}
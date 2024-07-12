import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class BoardContent extends StatelessWidget {
  const BoardContent({
    super.key,
    required this.quillController,
  });

  final quill.QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: quill.QuillToolbar.simple(
        configurations: quill.QuillSimpleToolbarConfigurations(
          controller: quillController,
          showDividers: true,
          showFontFamily: false,
          showFontSize: false,
          showBoldButton: true,
          showItalicButton: false,
          showSmallButton: false,
          showUnderLineButton: true,
          showLineHeightButton: false,
          showStrikeThrough: true,
          showInlineCode: false,
          showColorButton: false,
          showBackgroundColorButton: false,
          showClearFormat: false,
          showAlignmentButtons: false,
          showLeftAlignment: false,
          showCenterAlignment: false,
          showRightAlignment: false,
          showJustifyAlignment: false,
          showHeaderStyle: false,
          showListNumbers: true,
          showListBullets: false,
          showListCheck: false,
          showCodeBlock: true,
          showQuote: false,
          showIndent: false,
          showLink: false,
          showUndo: false,
          showRedo: false,
          showDirection: false,
          showSearchButton: false,
          showSubscript: false,
          showSuperscript: false,
          showClipboardCut: false,
          showClipboardCopy: false,
          showClipboardPaste: false,
        ),
      ),
    );
  }
}
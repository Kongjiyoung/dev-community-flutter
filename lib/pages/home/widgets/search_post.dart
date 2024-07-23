import 'package:dev_community/pages/home/viewmodel/bookmark_viewmodel.dart';
import 'package:dev_community/pages/my/pages/profile_detail.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import '../../../_core/constants/http.dart';
import '../../board/detail_page.dart';
import '../viewmodel/home_viewmodel.dart';

class SearchPost extends StatelessWidget {
  final int boardId;
  final String title;
  final quill.QuillController content;

  final int maxContentLength = 60; // 최대 글자 수 설정


  const SearchPost({
    required this.boardId,
    required this.title,
    required this.content,
  });

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    String truncatedContent =
    _truncateText(content.document.toPlainText(), maxContentLength);
    quill.QuillController truncatedContentController = quill.QuillController(
      document: quill.Document()..insert(0, truncatedContent),
      selection: TextSelection.collapsed(offset: 0),
    );

    truncatedContentController.readOnly = true;

    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      color: Color(0xFFF5FEF5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardDetailPage(boardId),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                quill.QuillEditor(
                  configurations: quill.QuillEditorConfigurations(
                    controller: truncatedContentController,
                    customStyles: quill.DefaultStyles(),
                  ),
                  focusNode: FocusNode(),
                  scrollController: ScrollController(),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
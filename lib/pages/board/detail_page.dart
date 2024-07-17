import 'dart:convert';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/board-all.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/bookmark-manager.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply-save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailPage extends ConsumerStatefulWidget {
  @override
  _BoardDetailPageState createState() => _BoardDetailPageState();
}

class _BoardDetailPageState extends ConsumerState<BoardDetailPage> {
  late quill.QuillController _quillController;
  late String dynamicText; // dynamicText 변수 추가

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  void loadContent() {
    var jsonString =
        '[{"insert":"aa"}, {"insert":"aaaaaaaaa", "attributes":{"bold":true}}, {"insert":"aa", "attributes":{"underline":true}}, {"insert":"aa", "attributes":{"strike":true}}, {"insert":"a"}, {"insert":"\\n", "attributes":{"list":"ordered"}}, {"insert":"aaaaa"}, {"insert":"\\n", "attributes":{"list":"ordered"}}, {"insert":"aaaaaaaa"}, {"insert":"\\n", "attributes":{"code-block":true}}, {"insert":"aaa"}, {"insert":"\\n", "attributes":{"code-block":true}}]';
    var document = quill.Document.fromJson(jsonDecode(jsonString));
    _quillController = quill.QuillController(
      document: document,
      selection: TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    // dynamicText에 값을 할당
    dynamicText = document.toPlainText(); // 예시로 간단히 플레인 텍스트를 가져옴
  }

  @override
  Widget build(BuildContext context) {
    var title = "제목입니다.";
    final bookmarkManager = ref.watch(bookmarkManagerProvider);
    final bookmarkManagerNotifier = ref.read(bookmarkManagerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          BoardAll(title: title, quillController: _quillController),
          ReplySave("assets/images/kakao_button.png"),
        ],
      ),
    );
  }
}

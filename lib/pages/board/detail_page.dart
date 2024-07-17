import 'dart:convert';
import 'package:dev_community/pages/board/viewmodal/board-detail-viewmodel.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/board-all.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply-save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailPage extends ConsumerStatefulWidget {
  final boardId;

  BoardDetailPage(this.boardId);

  @override
  _BoardDetailPageState createState() => _BoardDetailPageState(boardId);
}

class _BoardDetailPageState extends ConsumerState<BoardDetailPage> {
  final boardId;

  late quill.QuillController _quillController;
  late String dynamicText;

  _BoardDetailPageState(this.boardId); // dynamicText 변수 추가

  @override
  void initState() {
    super.initState();
  }

  void loadContent(String jsonString) {
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
    BoardDetailModel? model = ref.watch(boardDetailProvider);
    print("boardContent : ${model!.boardContent}");

    final boardContent = model!.boardContent;
    loadContent(boardContent); // Quill 컨트롤러를 초기화

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
          BoardAll(title: model!.boardTitle, quillController: _quillController),
          ReplySave("assets/images/kakao_button.png"),
        ],
      ),
    );
  }
}

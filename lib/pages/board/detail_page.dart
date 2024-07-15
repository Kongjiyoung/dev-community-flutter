import 'dart:convert';
import 'dart:ui';

import 'package:dev_community/pages/board/widgets/detail-page-widgets/board-all.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/bookmark-manager.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply-save.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import 'widgets/detail-page-widgets/like-manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BoardDetailPage(),
    );
  }
}

class BoardDetailPage extends StatefulWidget {
  @override
  _BoardDetailPageState createState() => _BoardDetailPageState();
}

class _BoardDetailPageState extends State<BoardDetailPage> {
  late quill.QuillController _quillController;
  late String dynamicText; // dynamicText 변수 추가
  final BookmarkManager bookmarkManager = BookmarkManager(); // 북마크 상태 관리 객체

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
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 상세 페이지"),
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
          BoardAll(bookmarkManager: bookmarkManager, title: title, quillController: _quillController),
          ReplySave("assets/images/kakao_button.png"),
        ],
      ),
    );
  }
}
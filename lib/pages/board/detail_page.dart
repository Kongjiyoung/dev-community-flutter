import 'dart:convert';

import 'package:dev_community/pages/board/widgets/detail-page-widgets/bookmark-manager.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply-save.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

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
          Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Profile(
                    bookmarkManager: bookmarkManager,
                    content: "사용자 1번 입니다.",
                    name: "하승진",
                    profileImg: "assets/images/kakao_button.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title, // title 여기 들어감
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          quill.QuillEditor(
                            configurations: quill.QuillEditorConfigurations(
                              controller: _quillController,
                              customStyles: quill.DefaultStyles(),
                            ),
                            focusNode: FocusNode(),
                            scrollController: ScrollController(),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "2024년 7월 10일 오전 12:00", // title 여기 들어감
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Divider(
                            color: Colors.grey, // 원하는 색상으로 설정 가능
                            thickness: 1.0, // 선의 두께
                            height: 20, // 선 위아래 여백 조정
                          ),
                          SizedBox(height: 10),
                          Text(
                            "댓글 4",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Reply(
                                    "${index + 1} 번째 댓글",
                                    "assets/images/kakao_button.png",
                                    "사용자 ${index + 2}",
                                    // 예를 들어 두 번째 댓글부터 사용자 2번, 세 번째 댓글부터 사용자 3번...
                                    "사용자 ${index + 2}번 입니다.");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50), // 댓글 입력창 높이만큼의 여백 추가
                ],
              ),
            ),
          ),
          ReplySave("assets/images/kakao_button.png"),
        ],
      ),
    );
  }
}
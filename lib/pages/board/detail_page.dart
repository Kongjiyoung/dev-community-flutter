import 'dart:convert';

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
        '[{"insert":"aa"}, {"insert":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "attributes":{"bold":true}}, {"insert":"aa", "attributes":{"underline":true}}, {"insert":"aa", "attributes":{"strike":true}}, {"insert":"a"}, {"insert":"\\n", "attributes":{"list":"ordered"}}, {"insert":"aaaaa"}, {"insert":"\\n", "attributes":{"list":"ordered"}}, {"insert":"aaaaaaaa"}, {"insert":"\\n", "attributes":{"code-block":true}}, {"insert":"aaa"}, {"insert":"\\n", "attributes":{"code-block":true}}]';
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(),
            Padding(
              padding: const EdgeInsets.all(10),
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
                      SizedBox(width: 10),
                      BookmarkIcon(
                        isBookmarked: bookmarkManager.isBookmarked,
                        onTap: () {
                          setState(() {
                            bookmarkManager.toggleBookmark();
                          });
                        },
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
                  SizedBox(height: 13),
                  Divider(
                    color: Colors.grey, // 원하는 색상으로 설정 가능
                    thickness: 1.0, // 선의 두께
                    height: 20, // 선 위아래 여백 조정
                  ),
                  SizedBox(height: 10),
                  Text(
                    "댓글 1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Reply(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkIcon extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onTap;

  const BookmarkIcon({
    required this.isBookmarked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked ? Colors.yellow : Colors.black,
      ),
    );
  }
}

class BookmarkManager {
  bool isBookmarked = false;

  void toggleBookmark() {
    isBookmarked = !isBookmarked;
  }
}

class Reply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReplyUp(),
        ReplyDown(),
      ],
    );
  }
}

class ReplyDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "댓글 내용을 여기에 입력합니다. 이 텍스트는 댓글의 내용을 나타냅니다.",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ReplyUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfileImage("assets/images/kakao_button.png"),
          SizedBox(width: 10),
          ProfileContent("공지영", "조장"),
          Spacer(),
          Row(
            children: [
              UpperRight(CupertinoIcons.exclamationmark, 30, Colors.red, onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ConfirmDialog(
                    onConfirm: () {
                      // 예 버튼을 눌렀을 때 처리할 로직 추가
                      // 예시: 신고하기 기능 구현
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('게시글을 신고하였습니다.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  final Function() onConfirm;

  ConfirmDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("게시글을 신고하시겠습니까?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // 다이얼로그 닫기
          },
          child: Text("아니오"),
        ),
        TextButton(
          onPressed: () {
            onConfirm(); // 확인 콜백 호출
            Navigator.of(context).pop(); // 다이얼로그 닫기
          },
          child: Text("예"),
        ),
      ],
    );
  }
}

class UpperRight extends StatelessWidget {
  final IconData iconData; // IconData 타입의 변수 선언
  final double size; // 아이콘 크기 변수 선언
  final Color color;
  final VoidCallback onTap;

  UpperRight(this.iconData, this.size, this.color, {required this.onTap}); // 아이콘 색상 변수 선언

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData, // 외부에서 지정한 아이콘 데이터 사용
        size: size, // 외부에서 지정한 크기 사용
        color: color, // 외부에서 지정한 색상 사용
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage("assets/images/kakao_button.png"),
        SizedBox(width: 10), // 이미지와 텍스트 간의 간격을 위한 SizedBox
        ProfileContent("하승진", "대표 직함"),
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // 텍스트를 오른쪽으로 정렬
          children: [
            UpperRight(Icons.bookmark_border, 30, Colors.black, onTap: () {
              // 북마크 버튼을 눌렀을 때의 동작 추가
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('북마크를 추가하였습니다.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }),
            SizedBox(width: 10),
            UpperRight(CupertinoIcons.exclamationmark, 30, Colors.red, onTap: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmDialog(
                  onConfirm: () {
                    // 예 버튼을 눌렀을 때 처리할 로직 추가
                    // 예시: 신고하기 기능 구현
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('게시글을 신고하였습니다.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}

class ProfileContent extends StatelessWidget {
  var name;
  var content;

  ProfileContent(this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Text(
          content,
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  var imgPath;

  ProfileImage(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imgPath),
            ),
          ],
        ),
      ),
    );
  }
}

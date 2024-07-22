import 'package:dev_community/pages/my/pages/profile_detail.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import '../../../_core/constants/http.dart';
import '../../board/detail_page.dart';

class BuildPost extends StatelessWidget {
  final int boardId;
  final int userId;
  final String name;
  final String? job;
  final String time;
  final String title;
  final quill.QuillController content;
  final String profileImage;
  final int views;
  final int loveCount;
  final int replyCount;
  final int maxContentLength = 60; // 최대 글자 수 설정
  final bool isLove;
  final bool isBookmark;

  const BuildPost({
    required this.boardId,
    required this.userId,
    required this.name,
    required this.job,
    required this.time,
    required this.title,
    required this.content,
    required this.profileImage,
    required this.views,
    required this.loveCount,
    required this.replyCount,
    required this.isLove,
    required this.isBookmark,
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
    String truncatedContent = _truncateText(content.document.toPlainText(), maxContentLength);

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
                  builder: (context) => ProfileDetail(userId), //프로필페이지로 바꾸기
                ),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(serverAddress + profileImage),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(job ?? "없음"),
                  ],
                ),
                Spacer(),
                Text(time),
              ],
            ),
          ),
          SizedBox(height: 20),
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
          Row(
            children: [
              Text("조회 "),
              Text("$views"),
              Spacer(),
              TextButton(
                onPressed: () {
                  // 댓글 아이콘 클릭 시 실행될 코드
                },
                child: Row(
                  children: [
                    if (isLove)
                      Icon(
                        Icons.favorite,
                        color: Color(0xFFafe897),
                      )
                    else
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xFFafe897),
                      ),
                    Text(
                      "$loveCount",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff323b27),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // 댓글 아이콘 클릭 시 실행될 코드
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.comment,
                      color: Color(0xFFafe897),
                    ),
                    Text(
                      "$replyCount",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff323b27),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // 저장 아이콘 클릭 시 실행될 코드
                },
                child: Row(
                  children: [
                    if (isBookmark)
                      Icon(
                        Icons.bookmark,
                        color: Color(0xFFafe897),
                      )
                    else
                      Icon(
                        Icons.bookmark_add_outlined,
                        color: Color(0xFFafe897),
                      ),
                    // Text(
                    //   "${bookmarkCount}",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Color(0xff323b27),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply_down.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply_up.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/rereply.dart';
import 'package:flutter/material.dart';

class Reply extends StatefulWidget {
  /// 댓글 내용
  var comment;

  /// 프로필 이미지 경로
  var profileImage;

  /// 사용자 이름
  var user;

  /// 사용자 설명
  var content;

  Reply(this.comment, this.profileImage, this.user, this.content);

  @override
  _ReplyState createState() =>
      _ReplyState(comment, profileImage, user, content);
}

class _ReplyState extends State<Reply> {
  var comment;
  var profileImage;
  var user;
  var content;

  _ReplyState(this.comment, this.profileImage, this.user, this.content);

  List<String> replies = [];
  bool showReplyField = false;
  final TextEditingController _replyController = TextEditingController();

  void _toggleReplyField() {
    setState(() {
      showReplyField = !showReplyField;
    });
  }

  void _addReply() {
    if (_replyController.text.isNotEmpty) {
      setState(() {
        replies.add(_replyController.text);
        _replyController.clear();
        showReplyField = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReplyUp(profileImage, user, content),
        ReplyDown(widget.comment),
        Padding(
          padding: const EdgeInsets.fromLTRB(52, 10, 0, 0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _toggleReplyField,
                child: Text(
                  '답글 달기',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showReplyField)
          Padding(
            padding: const EdgeInsets.fromLTRB(48, 10, 10, 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // 회색 배경
                      borderRadius: BorderRadius.circular(8), // 둥근 테두리
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: _replyController,
                              decoration: InputDecoration(
                                hintText: '답글을 입력하세요.',
                                border: InputBorder.none, // 테두리 없음
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: _addReply,
                          child:
                          Text('등록', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        Column(
          children: replies
              .map((reply) => Rereply(
              reply, "assets/images/kakao_button.png", "사용자2", "사용자2"))
              .toList(),
        ),
        Divider(
          color: Colors.grey,
          thickness: 1.0,
          height: 20,
        ),
      ],
    );
  }
}

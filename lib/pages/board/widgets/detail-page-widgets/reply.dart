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
  var name;

  /// 사용자 설명
  var content;

  Reply(
      {required this.comment,
      required this.profileImage,
      required this.name,
      required this.content});

  @override
  _ReplyState createState() =>
      _ReplyState(comment, profileImage, name, content);
}

class _ReplyState extends State<Reply> {
  var comment;
  var profileImage;
  var name;
  var content;

  _ReplyState(this.comment, this.profileImage, this.name, this.content);

  List<String> replies = [];
  bool showReplyField = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReplyUp(profileImage, name, content),
        ReplyDown(widget.comment),
        SizedBox(height: 10),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply_down.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply_up.dart';
import 'package:flutter/material.dart';

class Rereply extends StatelessWidget {
  var comment;
  var profileImg;
  var name;
  var content;

  Rereply(this.comment, this.profileImg, this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReplyUp(profileImg, name, content),
          ReplyDown(comment),
        ],
      ),
    );
  }
}
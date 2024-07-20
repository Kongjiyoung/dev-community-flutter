import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply.dart';
import 'package:flutter/material.dart';

import '../../../../dtos/board/board_response.dart';

class ReplyAll extends StatelessWidget {
  final String createdAt;
  final int boardHit;
  final int replyCount;
  final List<ReplyDTO> replies;

  ReplyAll(
      {required this.createdAt,
      required this.boardHit,
      required this.replies,
      required this.replyCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            createdAt,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text("조회수 : ${boardHit}"),
        ]),
        Divider(
          color: Colors.grey, // 원하는 색상으로 설정 가능
          thickness: 5.0, // 선의 두께
          height: 20, // 선 위아래 여백 조정
        ),
        SizedBox(height: 10),
        Text(
          "댓글 ${replyCount}",
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
            itemCount: replyCount,
            itemBuilder: (context, index) {
              ReplyDTO reply = replies[index];
              return Reply(
                content: reply.userPosition,
                comment: reply.comment,
                profileImage: reply.userImage,
                name: reply.userNickname,
              );
            },
          ),
        ),
      ],
    );
  }
}

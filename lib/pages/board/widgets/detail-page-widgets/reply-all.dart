import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply.dart';
import 'package:flutter/material.dart';

class ReplyAll extends StatelessWidget {
  const ReplyAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "2024년 7월 10일 오전 12:00",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text("조회수 : 100"),
          ]
        ),
        Divider(
          color: Colors.grey, // 원하는 색상으로 설정 가능
          thickness: 5.0, // 선의 두께
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
    );
  }
}
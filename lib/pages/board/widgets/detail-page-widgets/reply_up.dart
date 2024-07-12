import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-content.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-image.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/upper-right.dart';
import 'package:flutter/material.dart';
import 'confirm-dialog.dart';

class ReplyUp extends StatelessWidget {
  var profileImg;
  var name;
  var content;

  ReplyUp(this.profileImg, this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfileImage(profileImg),
          SizedBox(width: 10),
          ProfileContent(name, content),
          Spacer(),
          Row(
            children: [
              UpperRight(Icons.flag, 30, Colors.red, onTap: () {
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
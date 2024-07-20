import 'package:dev_community/pages/my/widgets/my_edit_btn.dart';
import 'package:dev_community/pages/my/widgets/my_info.dart';
import 'package:flutter/material.dart';

class MyProfileSliverHeaderData extends StatelessWidget {
  final String? profileImage;
  final String nickname;
  final String? position;
  final String? introduce;

  MyProfileSliverHeaderData(
      {required this.nickname,
      this.position,
      this.introduce,
      this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 60),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            MyInfo(
                profileImage: profileImage,
                nickname: nickname,
                position: position ?? "포지션 없음",
                introduce: introduce ?? "자기 소개"),
            SizedBox(width: double.infinity, child: MyEditBtn()),
          ],
        ),
      ),
    );
  }
}

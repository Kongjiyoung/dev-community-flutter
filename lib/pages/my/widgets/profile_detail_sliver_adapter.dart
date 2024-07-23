import 'package:dev_community/pages/my/widgets/my_info.dart';
import 'package:flutter/material.dart';

class ProfileDetailSliverAdapter extends StatelessWidget {
  final String nickname;
  final String profileImage;
  final String position;
  final String introduce;
  final int boardCount;

  ProfileDetailSliverAdapter(
      {required this.nickname,
      required this.boardCount,
      required this.profileImage,
      required this.position,
      required this.introduce});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          children: [
            MyInfo(
              nickname: nickname,
              profileImage: profileImage,
              position: position,
              introduce: introduce,
            ),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Text(
                  "게시물 ${boardCount}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-image.dart';
import 'package:flutter/material.dart';

class ReplySave extends StatelessWidget {
  var profileImg;

  ReplySave(this.profileImg);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ProfileImage(profileImg),
            SizedBox(width: 20),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '여기에 댓글을 입력하세요.',
                            border: InputBorder.none, // 테두리 없음
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        '등록',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-content.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-image.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/upper-right.dart';
import 'package:flutter/material.dart';

import 'bookmark-manager.dart';
import 'confirm-dialog.dart';

class Profile extends StatefulWidget {
  final BookmarkManager bookmarkManager;
  var profileImg;
  var name;
  var content;

  Profile(
      {required this.bookmarkManager,
        required this.profileImg,
        required this.name,
        required this.content});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(widget.profileImg),
        SizedBox(width: 10), // 이미지와 텍스트 간의 간격을 위한 SizedBox
        ProfileContent(widget.name, widget.content),
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UpperRight(
              widget.bookmarkManager.isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              30,
              widget.bookmarkManager.isBookmarked
                  ? Colors.yellow
                  : Colors.black,
              onTap: () {
                setState(() {
                  widget.bookmarkManager.toggleBookmark();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      widget.bookmarkManager.isBookmarked
                          ? '북마크를 추가하였습니다.'
                          : '북마크를 제거하였습니다.',
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            SizedBox(width: 10),
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
    );
  }
}

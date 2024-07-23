import 'package:dev_community/pages/board/viewmodal/board_detail_viewmodel.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile_content.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  final int boardId;
  final String profileImg;
  final String name;
  final String? content;
  final bool isBookMark;
  final BoardDetailViewModel viewmodel;

  Profile( {
    required this.boardId,
    required this.profileImg,
    required this.name,
    required this.content,
    required this.isBookMark,
    required this.viewmodel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ProfileImage(profileImg),
        SizedBox(width: 10), // 이미지와 텍스트 간의 간격을 위한 SizedBox
        ProfileContent(name, content),
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                if(isBookMark){
                  viewmodel.bookMarkDelete(boardId);
                }else{
                  viewmodel.bookMarkSave(boardId);
                }
              },
              child: Icon(
                isBookMark ? Icons.bookmark : Icons.bookmark_border,
                size: 30,
                color: isBookMark ? Colors.yellow : Colors.black,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

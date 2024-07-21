import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile_content.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile_image.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/upper_right.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../dtos/bookmark/bookmark_manager.dart';

class Profile extends ConsumerWidget {
  final int boardId;
  final String profileImg;
  final String name;
  final String? content;
  final bool isBookMark;

  Profile({
    required this.boardId,
    required this.profileImg,
    required this.name,
    required this.content,
    required this.isBookMark,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 초기화: 서버에서 받은 isBookMark 값을 초기 상태로 설정
    final bookmarkManagerState = ref.watch(bookmarkManagerProvider(isBookMark));
    final bookmarkManagerNotifier = ref.read(bookmarkManagerProvider(isBookMark).notifier);
    return Row(
      children: [
        ProfileImage(profileImg),
        SizedBox(width: 10), // 이미지와 텍스트 간의 간격을 위한 SizedBox
        ProfileContent(name, content),
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UpperRight(
              bookmarkManagerState ? Icons.bookmark : Icons.bookmark_border,
              30,
              bookmarkManagerState ? Colors.yellow : Colors.black,
              onTap: () async {
                await bookmarkManagerNotifier.toggleBookmark(boardId);
              },
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

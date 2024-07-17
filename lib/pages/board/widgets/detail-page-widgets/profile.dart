import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-content.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-image.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/upper-right.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bookmark-manager.dart';
import 'confirm-dialog.dart';

class Profile extends ConsumerWidget {
  var profileImg;
  var name;
  var content;

  Profile({
    required this.profileImg,
    required this.name,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkManager = ref.watch(bookmarkManagerProvider);
    final bookmarkManagerNotifier = ref.read(bookmarkManagerProvider.notifier);

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
              bookmarkManager ? Icons.bookmark : Icons.bookmark_border,
              30,
              bookmarkManager ? Colors.yellow : Colors.black,
              onTap: () {
                bookmarkManagerNotifier.toggleBookmark();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      bookmarkManager ? '북마크를 추가하였습니다.' : '북마크를 제거하였습니다.',
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

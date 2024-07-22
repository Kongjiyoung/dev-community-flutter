import 'package:dev_community/pages/home/viewmodel/bookmark_viewmodel.dart';
import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPostPage extends ConsumerWidget {
  const SavedPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookmarkModel? model = ref.watch(bookmarkBoardListProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text("저장한 게시글"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: model!.contentList!.length,
          itemBuilder: (context, index) {
            final post = model.contentList![index];
            return Column(
              children: [
                BuildPost(
                  userId: post.userId,
                  boardId: post.boardId,
                  name: post.userNickname,
                  job: post.userPosition,
                  time: post.boardCreatedAt,
                  title: post.boardTitle,
                  content: post.boardContent,
                  profileImage: post.userImage,
                  views: post.boardViews,
                  loveCount: post.loveCount,
                  replyCount: post.replyCount,
                  isLove: post.love  == "true",
                  isBookmark: post.bookmark  == "true",
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

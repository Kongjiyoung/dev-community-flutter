import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPostPage extends ConsumerWidget {
  const SavedPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeModel? model = ref.watch(homeBoardListProvider);


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
                  boardId: 1,
                  name: post.userNickname!,
                  job: post.userPosition,
                  time: post.boardCreatedAtDuration!,
                  title: post.boardTitle!,
                  content: post.boardContent!,
                  profileImage: post.userImage,
                  views: post.boardHit!,
                  loveCount: post.likeCount!,
                  replyCount: post.replyCount!,
                  bookmarkCount: post.bookmarkCount!,
                  isLove: post.myLike  == "true",
                  isBookmark: post.myBookmark  == "true",
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

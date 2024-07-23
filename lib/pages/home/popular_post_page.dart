import 'package:dev_community/pages/home/viewmodel/popular_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:dev_community/pages/home/widgets/popular-post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularPostPage extends ConsumerWidget {
  const PopularPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PopularModel? model = ref.watch(popularBoardListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("인기 게시글"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: model!.contentList!.length,
          itemBuilder: (context, index) {
            final post = model.contentList![index];
            return Column(
              children: [
                PopularPost(
                  boardId: post.boardId,
                  name: post.userNickname!,
                  job: post.userPosition,
                  title: post.boardTitle,
                  rank: post.rank,
                  userImage: post.userImage,
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

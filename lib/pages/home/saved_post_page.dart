import 'package:dev_community/pages/home/viewmodel/bookmark_viewmodel.dart';
import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:dev_community/pages/home/widgets/post_view.dart';
import 'package:dev_community/pages/home/widgets/saved_post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPostPage extends ConsumerWidget {
  const SavedPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookmarkModel? model = ref.watch(bookmarkBoardListProvider);
    BookmarkViewmodel? viewmodel = ref.read(bookmarkBoardListProvider.notifier);

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
                SavedPostView(
                  contentList: model!.contentList,
                  bookmarkViewmodel: viewmodel,
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

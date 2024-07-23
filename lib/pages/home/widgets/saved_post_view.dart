import 'dart:convert';

import 'package:dev_community/_core/util/string_convertor.dart';
import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/pages/home/widgets/saved_post_list.dart';
import 'package:dev_community/pages/my/viewmodel/my_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import '../../../dtos/board/board_response.dart';
import '../viewmodel/bookmark_viewmodel.dart';
import '../viewmodel/home_viewmodel.dart';
import 'build-post.dart';

class SavedPostView extends StatefulWidget {
  final List<BookmarkContent> contentList;
  final BookmarkViewmodel bookmarkViewmodel;

  SavedPostView({required this.contentList, required this.bookmarkViewmodel});

  @override
  _SaveHomeViewState createState() => _SaveHomeViewState();
}

class _SaveHomeViewState extends State<SavedPostView> {
  late ScrollController boardScrollController;
  late quill.QuillController _quillController;

  void loadContent(String jsonString) {
    var document = quill.Document.fromJson(jsonDecode(jsonString));
    _quillController = quill.QuillController(
      document: document,
      selection: TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  @override
  void initState() {
    super.initState();
    boardScrollController = ScrollController()
      ..addListener(() {
        if (boardScrollController.position.pixels ==
            boardScrollController.position.maxScrollExtent) {
          widget.bookmarkViewmodel.getListForTab();
        }
      });
  }

  @override
  void dispose() {
    boardScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.contentList.isEmpty
        ? Center(child: Text("저장한 게시물 없음"))
        : ListView.builder(
      controller: boardScrollController,
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.contentList.length,
      itemBuilder: (context, index) {
        final post = widget.contentList[index];
        loadContent(post.boardContent);
        return Column(
          children: [
            SavedPostList(
              boardId: post.boardId,
              name: post.userNickname,
              job: post.userPosition,
              time: post.boardCreatedAt,
              title: post.boardTitle,
              content: _quillController,
              profileImage: post.userImage,
              views: post.boardViews,
              loveCount: post.loveCount,
              replyCount: post.replyCount,
              myLike: post.love,
              myBookMark: post.bookmark,
              userId: post.userId,
              bookmarkViewmodel: widget.bookmarkViewmodel,
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

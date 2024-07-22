import 'dart:convert';

import 'package:dev_community/_core/util/string_convertor.dart';
import 'package:dev_community/dtos/mypage/my_page_response.dart';
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
    return Expanded(
      child: widget.contentList.isEmpty
          ? Center(child: Text("작성한 게시물 없음"))
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
                    BuildPost(
                      boardId: widget.contentList[index].boardId,
                      name: widget.contentList[index].userNickname!,
                      job: widget.contentList[index].userPosition,
                      time: widget.contentList[index].boardCreatedAt!,
                      title: widget.contentList[index].boardTitle!,
                      content: _quillController!,
                      profileImage: widget.contentList[index].userImage,
                      views: widget.contentList[index].boardViews!,
                      loveCount: widget.contentList[index].loveCount!,
                      replyCount: widget.contentList[index].replyCount!,
                      isLove : widget.contentList[index].love!,
                      isBookmark : widget.contentList[index].bookmark,
                      userId: widget.contentList[index].userId,
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
    );
  }
}

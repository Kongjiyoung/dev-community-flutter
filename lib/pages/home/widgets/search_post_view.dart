import 'dart:convert';

import 'package:dev_community/pages/home/viewmodel/search_post_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/search_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import '../../../dtos/board/board_response.dart';

class SearchPostView extends StatefulWidget {
  final List<SearchBoardListDTO> searchBoardList;
  final SearchPostViewmodel searchPostViewmodel;

  SearchPostView(
      {required this.searchBoardList, required this.searchPostViewmodel});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<SearchPostView> {
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
          widget.searchPostViewmodel.addNewBoardList();
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
      child: widget.searchBoardList.isEmpty
          ? Center(child: Text("작성한 게시물 없음"))
          : ListView.builder(
              controller: boardScrollController,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.searchBoardList.length,
              itemBuilder: (context, index) {
                final post = widget.searchBoardList[index];
                loadContent(post.boardContent);
                return Column(
                  children: [
                    SearchPost(
                      boardId: post.boardId,
                      title: post.boardTitle!,
                      content: _quillController!,
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
    );
  }
}

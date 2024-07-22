import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkModel {
  List<BookmarkContent>? contentList;

  BookmarkModel({this.contentList});
}

class BookmarkViewmodel extends StateNotifier<BookmarkModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  BookmarkViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BoardRepository().fetchBookmarkBoardList();

    if (responseDTO.status == 200) {
      state = BookmarkModel(contentList: responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final bookmarkBoardListProvider =
    StateNotifierProvider<BookmarkViewmodel, BookmarkModel?>((ref) {
  return BookmarkViewmodel(null, ref)..notifyInit();
});

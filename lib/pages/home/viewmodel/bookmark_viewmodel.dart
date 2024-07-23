import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/repository/book_mark_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dtos/repository/like_repository.dart';

class BookmarkModel {
  List<BookmarkContent> contentList;
  int? boardPage;
  bool isBoardLastPage;

  BookmarkModel(
      {required this.contentList, this.boardPage, this.isBoardLastPage = false});

  BookmarkModel copyWith({
    List<BookmarkContent>? contentList,
    int? boardPage,
    bool? isBoardLastPage
  }) {
    return BookmarkModel(
        contentList: contentList ?? this.contentList,
        boardPage: boardPage ?? this.boardPage,
        isBoardLastPage: isBoardLastPage ?? this.isBoardLastPage
    );
  }

}

class BookmarkViewmodel extends StateNotifier<BookmarkModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  BookmarkViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BookMarkRepository().bookMarkList();

    if (responseDTO.status == 200) {
      state = BookmarkModel(contentList: responseDTO.body, boardPage: 1);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> getListForTab() async {
    if (!state!.isBoardLastPage) {
      ResponseDTO responseDTO = await BookMarkRepository()
          .bookMarkList(page: state!.boardPage! + 1);

      if (responseDTO.status == 200) {
        if (responseDTO.body.isNotEmpty) {
          List<BookmarkContent> contentList = state!.contentList;
          state!.contentList.addAll(responseDTO.body);
          state = state!.copyWith(
            boardPage: state!.boardPage! + 1,
            contentList: List.from(state!.contentList)
              ..addAll(responseDTO.body),
          );
        } else {
          state = state!.copyWith(isBoardLastPage: true);
        }
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(
            content: Text("게시글 불러오기 실패 : ${responseDTO.msg}")));
      }
    }
  }

  Future<void> bookMarkSave(int boardId) async {
    ResponseDTO responseDTO = await BookMarkRepository().bookMarkSave(boardId);

    if (responseDTO.status == 200) {
      state = state!.copyWith(
        contentList: state!.contentList.map((content) {
          if (content.boardId == boardId) {
            return content.copyWith(bookmark: true);
          }
          return content;
        }).toList(),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("북마크 추가 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> bookMarkDelete(int boardId) async {
    ResponseDTO responseDTO =
    await BookMarkRepository().bookMarkDelete(boardId);

    if (responseDTO.status == 200) {
      state = state!.copyWith(
        contentList: state!.contentList.map((bookmarkContent) {
          if (bookmarkContent.boardId == boardId) {
            return bookmarkContent.copyWith(bookmark: false);
          }
          return bookmarkContent;
        }).toList(),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("북마크 삭제 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> likeSave(int boardId) async {
    ResponseDTO responseDTO = await LikeRepository().likeSave(boardId);

    if (responseDTO.status == 200) {
      state = state!.copyWith(
        contentList: state!.contentList.map((content) {
          if (content.boardId == boardId) {
            return content.copyWith(love: true, loveCount: content.loveCount + 1);
          }
          return content;
        }).toList(),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("좋아요 추가 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> likeDelete(int boardId) async {
    ResponseDTO responseDTO = await LikeRepository().likeDelete(boardId);

    if (responseDTO.status == 200) {
      state = state!.copyWith(
        contentList: state!.contentList.map((content) {
          if (content.boardId == boardId) {
            return content.copyWith(love: false, loveCount: content.loveCount - 1);
          }
          return content;
        }).toList(),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("좋아요 삭제 실패 : ${responseDTO.msg}")));
    }
  }

}


final bookmarkBoardListProvider =
    StateNotifierProvider<BookmarkViewmodel, BookmarkModel?>((ref) {
  return BookmarkViewmodel(null, ref)..notifyInit();
});

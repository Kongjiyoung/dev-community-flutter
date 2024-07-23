import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/dtos/board/board_request.dart';
import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dtos/repository/book_mark_repository.dart';
import '../../../dtos/repository/like_repository.dart';
import '../../board/viewmodal/board_detail_viewmodel.dart';

class HomeModel {
  List<Content> contentList;
  int? boardPage;
  bool isBoardLastPage;

  HomeModel(
      {required this.contentList,
      this.boardPage,
      this.isBoardLastPage = false});

  HomeModel copyWith(
      {List<Content>? contentList, int? boardPage, bool? isBoardLastPage}) {
    return HomeModel(
        contentList: contentList ?? this.contentList,
        boardPage: boardPage ?? this.boardPage,
        isBoardLastPage: isBoardLastPage ?? this.isBoardLastPage);
  }
}
class HomeViewmodel extends StateNotifier<HomeModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  HomeViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BoardRepository().fetchBoardList();

    if (responseDTO.status == 200) {
      state = HomeModel(contentList: responseDTO.body, boardPage: 1);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> getListForTab() async {
    if (!state!.isBoardLastPage) {
      ResponseDTO responseDTO =
      await BoardRepository().fetchBoardList(page: state!.boardPage! + 1);

      if (responseDTO.status == 200) {
        if (responseDTO.body.isNotEmpty) {

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
        ScaffoldMessenger.of(mContext!).showSnackBar(
            SnackBar(content: Text("게시글 불러오기 실패 : ${responseDTO.msg}")));
      }
    }
  }

  Future<void> saveBoard(SaveBoardDTO saveBoardDTO) async {
    ResponseDTO responseDTO = await BoardRepository().boardSave(saveBoardDTO);

    if (responseDTO.status == 200) {
      notifyInit();
      Navigator.pushNamedAndRemoveUntil(
        mContext!,
        Move.mainPage,
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("글 작성 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> bookMarkSave(int boardId) async {
    ResponseDTO responseDTO = await BookMarkRepository().bookMarkSave(boardId);

    if (responseDTO.status == 200) {
      state = state!.copyWith(
        contentList: state!.contentList.map((content) {
          if (content.boardId == boardId) {
            return content.copyWith(myBookmark: true);
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
        contentList: state!.contentList.map((content) {
          if (content.boardId == boardId) {
            return content.copyWith(myBookmark: false);
          }
          return content;
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
            return content.copyWith(myLike: true, likeCount: content.likeCount + 1);
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
            return content.copyWith(myLike: false, likeCount: content.likeCount - 1);
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

final homeBoardListProvider =
StateNotifierProvider<HomeViewmodel, HomeModel?>((ref) {
  return HomeViewmodel(null, ref)..notifyInit();
});
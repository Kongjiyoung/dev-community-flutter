import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/reply/reply_request.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/repository/book_mark_repository.dart';
import 'package:dev_community/dtos/repository/reply_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dtos/repository/like_repository.dart';

class BoardDetailModel {
  BoardDetailDTO boardDetailDTO;
  bool? isChanged = false;
  BoardDetailModel({ required this.boardDetailDTO, this.isChanged});
}

class BoardDetailViewModel extends StateNotifier<BoardDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  BoardDetailViewModel(super._state, this.ref);

  Future<void> notifyInit(int boardId) async {
    ResponseDTO responseDTO = await BoardRepository().fetchBoardDetail(boardId);

    if (responseDTO.status == 200) {
      state = BoardDetailModel(boardDetailDTO: responseDTO.body);
      state?.isChanged = true;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> bookMarkSave(int boardId) async {
    ResponseDTO responseDTO = await BookMarkRepository().bookMarkSave(boardId);

    if (responseDTO.status == 200) {
      state = BoardDetailModel(boardDetailDTO: state!.boardDetailDTO.copyWith(myBookmark: true));
      state?.isChanged = true;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("북마크 추가 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> bookMarkDelete(int boardId) async {
    ResponseDTO responseDTO = await BookMarkRepository().bookMarkDelete(
        boardId);

    if (responseDTO.status == 200) {
      state = BoardDetailModel(boardDetailDTO: state!.boardDetailDTO.copyWith(myBookmark: false));
      state?.isChanged = true;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("북마크 삭제 실패 : ${responseDTO.msg}")));
    }
  }

  Future<bool> replySave(int boardId, String comment) async {
    bool success = false;

    ResponseDTO responseDTO = await ReplyRepository().replySave(
        boardId, ReplySaveDTO(comment));

    if (responseDTO.status == 200) {
      notifyInit(boardId);
      success = true;
      state?.isChanged = true;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("댓글 작성 실패 : ${responseDTO.msg}")));
    }

    return success;
  }

  Future<void> likeSave(int boardId) async {
    ResponseDTO responseDTO = await LikeRepository().likeSave(boardId);

    if (responseDTO.status == 200) {
      state = BoardDetailModel(boardDetailDTO: state!.boardDetailDTO.copyWith(myLike: true, likeCount: state!.boardDetailDTO.likeCount + 1));
      state?.isChanged = true;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("좋아요 추가 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> likeDelete(int boardId) async {
    ResponseDTO responseDTO = await LikeRepository().likeDelete(boardId);

    if (responseDTO.status == 200) {
      state = BoardDetailModel(boardDetailDTO: state!.boardDetailDTO.copyWith(myLike: false, likeCount: state!.boardDetailDTO.likeCount - 1));
      state?.isChanged = true;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("좋아요 삭제 실패 : ${responseDTO.msg}")));
    }
  }
}

final boardDetailProvider = StateNotifierProvider.family
    .autoDispose<BoardDetailViewModel, BoardDetailModel?, int>(
        (ref, boardId) {
      return BoardDetailViewModel(null, ref)
        ..notifyInit(boardId);
    });
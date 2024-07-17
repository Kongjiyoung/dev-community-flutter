import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailModel {
  final int boardId;
  final String boardTitle;
  final String boardContent;
  final int boardHit;
  final String boardCreatedAt;
  final String boardCreatedAtDuration;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final bool myLike;
  final bool myBookmark;
  final int likeCount;
  final int bookmarkCount;
  final int replyCount;
  final List<ReplyDTO> replies;

  BoardDetailModel(
      this.boardId,
      this.boardTitle,
      this.boardContent,
      this.boardHit,
      this.boardCreatedAt,
      this.boardCreatedAtDuration,
      this.userId,
      this.userNickname,
      this.userPosition,
      this.userImage,
      this.myLike,
      this.myBookmark,
      this.likeCount,
      this.bookmarkCount,
      this.replyCount,
      this.replies);
}

class BoardDetailViewModel extends StateNotifier<BoardDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  BoardDetailViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BoardRepository().fetchBoardDetail();

    if (responseDTO.status == 200) {
      state = responseDTO.body;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final boardDetailProvider =
    StateNotifierProvider<BoardDetailViewModel, BoardDetailModel?>((ref) {
  return BoardDetailViewModel(null, ref)..notifyInit();
});

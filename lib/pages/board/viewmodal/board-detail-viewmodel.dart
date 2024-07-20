import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailModel {
  BoardDetailDTO boardDetailDTO;

  BoardDetailModel(this.boardDetailDTO);
}

class BoardDetailViewModel extends StateNotifier<BoardDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  BoardDetailViewModel(super._state, this.ref);

  Future<void> notifyInit(int boardId) async {
    ResponseDTO responseDTO = await BoardRepository().fetchBoardDetail(boardId);

    if (responseDTO.status == 200) {
      state = BoardDetailModel(responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> addReply(int boardId) async {
    await notifyInit(boardId);
  }
}

final boardDetailProvider = StateNotifierProvider.family
    .autoDispose<BoardDetailViewModel, BoardDetailModel?, int>(
        (ref, challengeId) {
      return BoardDetailViewModel(null, ref)..notifyInit(challengeId);
    });
import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/dtos/board/board_request.dart';
import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeModel {
  List<Content>? contentList;

  HomeModel({this.contentList});
}

class HomeViewmodel extends StateNotifier<HomeModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  HomeViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BoardRepository().fetchBoardList();

    if (responseDTO.status == 200) {
      state = HomeModel(contentList: responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> saveBoard(SaveBoardDTO saveBoardDTO) async {
    ResponseDTO responseDTO = await BoardRepository().boardSave(saveBoardDTO);

    if (responseDTO.status == 200) {
      notifyInit();
      Navigator.pushNamedAndRemoveUntil(mContext!, Move.mainPage, (route) => false,);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("글 작성 실패 : ${responseDTO.msg}")));
    }
  }
}

final homeBoardListProvider =
    StateNotifierProvider<HomeViewmodel, HomeModel?>((ref) {
  return HomeViewmodel(null, ref)..notifyInit();
});

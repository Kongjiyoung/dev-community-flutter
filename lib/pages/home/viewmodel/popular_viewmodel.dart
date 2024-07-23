import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularModel {
  List<TopTenContent>? contentList;

  PopularModel({this.contentList});
}

class PopularViewmodel extends StateNotifier<PopularModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  PopularViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BoardRepository().fetchPopularBoardList();

    if (responseDTO.status == 200) {
      state = PopularModel(contentList: responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("인기 게시물 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final popularBoardListProvider =
    StateNotifierProvider<PopularViewmodel, PopularModel?>((ref) {
  return PopularViewmodel(null, ref)..notifyInit();
});

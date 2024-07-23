import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/repository/board_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPostModel {
  List<SearchBoardListDTO> searchBoardListDTO;
  String query;
  int page;
  bool isLastPage;

  SearchPostModel({
    required this.searchBoardListDTO,
    required this.page,
    required this.query,
    this.isLastPage = false,
  });

  SearchPostModel copyWith({
    List<SearchBoardListDTO>? searchBoardListDTO,
    String? query,
    int? page,
    bool? isLastPage,
  }) {
    return SearchPostModel(
      searchBoardListDTO: searchBoardListDTO ?? this.searchBoardListDTO,
      query: query ?? this.query,
      page: page ?? this.page,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}

class SearchPostViewmodel extends StateNotifier<SearchPostModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SearchPostViewmodel(super._state, this.ref);

  Future<void> notifyInit(String query) async {
    ResponseDTO responseDTO =
        await BoardRepository().fetchSearchedBoardList(query);

    if (responseDTO.status == 200) {
      state = SearchPostModel(
          searchBoardListDTO: responseDTO.body, page: 1, query: query);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("검색 리스트 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> addNewBoardList() async {
    if (state!.isLastPage) return;

    ResponseDTO responseDTO = await BoardRepository()
        .fetchSearchedBoardList(state!.query, page: state!.page + 1);

    List<SearchBoardListDTO> searchBoardList = state!.searchBoardListDTO;

    if (responseDTO.status == 200) {
      if (searchBoardList.isEmpty) {
        state = state!.copyWith(isLastPage: true);
      } else {
        searchBoardList.addAll(responseDTO.body);
        state = state!.copyWith(searchBoardListDTO: searchBoardList);
      }
    }
  }
}

final searchPostProvider = StateNotifierProvider.autoDispose
    .family<SearchPostViewmodel, SearchPostModel?, String>(
  (ref, query) {
    return SearchPostViewmodel(null, ref)..notifyInit(query);
  },
);

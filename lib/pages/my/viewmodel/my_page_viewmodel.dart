import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageModel {
  MyPageDTO myPageDTO;
  int? boardPage;
  int? replyPage;
  bool isBoardLastPage;
  bool isReplyLastPage;

  MyPageModel(
      {required this.myPageDTO,
      this.boardPage,
      this.replyPage,
      this.isBoardLastPage = false,
      this.isReplyLastPage = false});

  MyPageModel copyWith({
    MyPageDTO? myPageDTO,
    int? boardPage,
    int? replyPage,
    bool? isBoardLastPage,
    bool? isReplyLastPage,
  }) {
    return MyPageModel(
      myPageDTO: myPageDTO ?? this.myPageDTO,
      boardPage: boardPage ?? this.boardPage,
      replyPage: replyPage ?? this.replyPage,
      isBoardLastPage: isBoardLastPage ?? this.isBoardLastPage,
      isReplyLastPage: isReplyLastPage ?? this.isReplyLastPage,
    );
  }
}

class MyPageViewmodel extends StateNotifier<MyPageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  MyPageViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepository().fetchMyPage();

    if (responseDTO.status == 200) {
      state =
          MyPageModel(myPageDTO: responseDTO.body, boardPage: 1, replyPage: 0);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("마이페이지 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> getListForTab(String type) async {
    switch (type) {
      case "boards":
        {
          if (!state!.isBoardLastPage) {
            ResponseDTO responseDTO = await UserRepository()
                .fetchMyPage(page: state!.boardPage! + 1, type: type);

            if (responseDTO.status == 200) {
              if (responseDTO.body.isNotEmpty) {
                List<MyBoardList> boardList = state!.myPageDTO.myBoardList;
                state!.myPageDTO.myBoardList.addAll(responseDTO.body);
                state = state!.copyWith(
                    boardPage: state!.boardPage! + 1,
                    myPageDTO:
                        state!.myPageDTO.copyWith(myBoardList: boardList));
              } else {
                state = state!.copyWith(isBoardLastPage: true);
              }
            } else {
              ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(
                  content: Text("내 게시글 불러오기 실패 : ${responseDTO.msg}")));
            }
          }
        }
      case "replies":
        {
          if (!state!.isReplyLastPage) {
            ResponseDTO responseDTO = await UserRepository()
                .fetchMyPage(page: state!.replyPage! + 1, type: type);

            if (responseDTO.status == 200) {
              if (responseDTO.body.isNotEmpty) {
                List<MyReplyList> replyList = state!.myPageDTO.myReplyList;
                state!.myPageDTO.myReplyList.addAll(responseDTO.body);
                state = state!.copyWith(
                    replyPage: state!.replyPage! + 1,
                    myPageDTO:
                        state!.myPageDTO.copyWith(myReplyList: replyList));
              } else {
                state = state!.copyWith(isReplyLastPage: true);
              }
            } else {
              ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(
                  content: Text("내 댓글 목록 불러오기 실패 : ${responseDTO.msg}")));
            }
          }
        }
    }
  }
}

final myPageProvider = StateNotifierProvider<MyPageViewmodel, MyPageModel?>(
  (ref) {
    return MyPageViewmodel(null, ref)..notifyInit();
  },
);

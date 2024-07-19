import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageModel {
  MyPageDTO myPageDTO;

  MyPageModel(this.myPageDTO);
}

class MyPageViewmodel extends StateNotifier<MyPageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  MyPageViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepository().fetchMyPage();

    if (responseDTO.status == 200) {
      state = MyPageModel(responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("마이페이지 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final myPageProvider = StateNotifierProvider<MyPageViewmodel, MyPageModel?>(
  (ref) {
    return MyPageViewmodel(null, ref)..notifyInit();
  },
);

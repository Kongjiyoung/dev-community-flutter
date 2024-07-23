import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/dtos/user/user_response.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetailModel {
  UserProfileDetailDTO userProfileDetailDTO;

  ProfileDetailModel(this.userProfileDetailDTO);
}

class ProfileDetailViewmodel extends StateNotifier<ProfileDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ProfileDetailViewmodel(super._state, this.ref);

  Future<void> notifyInit(int userId) async {
    ResponseDTO responseDTO = await UserRepository().fetchUserDetail(userId);

    if (responseDTO.status == 200) {
      state = ProfileDetailModel(responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("프로필 상세보기 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final profileDetailProvider = StateNotifierProvider.family<
    ProfileDetailViewmodel, ProfileDetailModel?, int>(
  (ref, userId) {
    return ProfileDetailViewmodel(null, ref)..notifyInit(userId);
  },
);

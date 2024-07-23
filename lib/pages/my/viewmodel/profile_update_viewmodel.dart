import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/dtos/user/user_response.dart';
import 'package:dev_community/main.dart';
import 'package:dev_community/pages/my/viewmodel/my_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateModel {
  UpdateProfileDTO updateProfileDTO;
  XFile? selectedImage;

  ProfileUpdateModel({required this.updateProfileDTO, this.selectedImage});

  ProfileUpdateModel copyWith({
    UpdateProfileDTO? updateProfileDTO,
    XFile? selectedImage,
  }) {
    return ProfileUpdateModel(
      updateProfileDTO: updateProfileDTO ?? this.updateProfileDTO,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }
}

class ProfileUpdateViewmodel extends StateNotifier<ProfileUpdateModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ProfileUpdateViewmodel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepository().fetchEditProfileView();

    if (responseDTO.status == 200) {
      state = ProfileUpdateModel(updateProfileDTO: responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("프로필 수정 페이지 불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> updateProfile(UpdateProfileRequestDTO requestDTO) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchUpdateProfile(requestDTO);

    if (responseDTO.status == 200) {
      state = state!.copyWith(updateProfileDTO: responseDTO.body);
      ref.read(myPageProvider.notifier).updateMyPage(responseDTO.body);
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("프로필 업데이트 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> editProfileImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      state = state!.copyWith(selectedImage: pickedFile);
    }

    Navigator.of(mContext!).pop();
  }
}

final profileUpdateProvider = StateNotifierProvider.autoDispose<
    ProfileUpdateViewmodel, ProfileUpdateModel?>(
  (ref) {
    return ProfileUpdateViewmodel(null, ref)..notifyInit();
  },
);

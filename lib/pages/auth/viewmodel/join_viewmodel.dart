import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinModel {
  JoinRequestDTO? joinRequestDTO;
  bool allAgree;
  bool overFourteen;
  bool termsAndConditions;
  bool personalInformation;
  bool receiveMarketing;

  JoinModel({
    this.joinRequestDTO,
    this.allAgree = false,
    this.overFourteen = false,
    this.termsAndConditions = false,
    this.personalInformation = false,
    this.receiveMarketing = false,
  });

  JoinModel copyWith({
    JoinRequestDTO? joinRequestDTO,
    bool? allAgree,
    bool? overFourteen,
    bool? termsAndConditions,
    bool? personalInformation,
    bool? receiveMarketing,
  }) {
    return JoinModel(
      joinRequestDTO: joinRequestDTO ?? this.joinRequestDTO,
      allAgree: allAgree ?? this.allAgree,
      overFourteen: overFourteen ?? this.overFourteen,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      personalInformation: personalInformation ?? this.personalInformation,
      receiveMarketing: receiveMarketing ?? this.receiveMarketing,
    );
  }
}

class JoinViewModel extends StateNotifier<JoinModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  JoinViewModel(super._state, this.ref);

  Future<void> join(JoinRequestDTO joinRequestDTO) async {
    if (state!.overFourteen &&
        state!.termsAndConditions &&
        state!.personalInformation &&
        state!.receiveMarketing) {
      ResponseDTO responseDTO =
          await UserRepository().fetchJoin(joinRequestDTO);

      if (responseDTO.status == 200) {
        ScaffoldMessenger.of(mContext!)
            .showSnackBar(SnackBar(content: Text("회원가입이 완료 되었습니다.")));
        Navigator.pushNamedAndRemoveUntil(
          mContext!,
          Move.loginPage,
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
            SnackBar(content: Text("회원가입 실패 : ${responseDTO.msg}")));
      }
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("동의하지 않은 필수 항목이 있습니다.")));
    }
  }

  void agreeAll() {
    if (state!.allAgree) {
      state = state!.copyWith(
          allAgree: false,
          overFourteen: false,
          termsAndConditions: false,
          personalInformation: false,
          receiveMarketing: false);
    } else {
      state = state!.copyWith(
          allAgree: true,
          overFourteen: true,
          termsAndConditions: true,
          personalInformation: true,
          receiveMarketing: true);
    }
  }

  void agreeOverFourteen() {
    bool allAgree = false;

    if (state!.overFourteen) {
      state = state!.copyWith(overFourteen: false, allAgree: false);
    } else {
      if (state!.termsAndConditions &&
          state!.personalInformation &&
          state!.receiveMarketing) {
        allAgree = true;
      }
      state = state!.copyWith(overFourteen: true, allAgree: allAgree);
    }
  }

  void agreeTermsAndConditions() {
    bool allAgree = false;

    if (state!.termsAndConditions) {
      state = state!.copyWith(termsAndConditions: false, allAgree: false);
    } else {
      if (state!.overFourteen &&
          state!.personalInformation &&
          state!.receiveMarketing) {
        allAgree = true;
      }
      state = state!.copyWith(termsAndConditions: true, allAgree: allAgree);
    }
  }

  void agreePersonalInformation() {
    bool allAgree = false;

    if (state!.personalInformation) {
      state = state!.copyWith(personalInformation: false, allAgree: false);
    } else {
      if (state!.overFourteen &&
          state!.termsAndConditions &&
          state!.receiveMarketing) {
        allAgree = true;
      }
      state = state!.copyWith(personalInformation: true, allAgree: allAgree);
    }
  }

  void agreeReceiveMarketing() {
    bool allAgree = false;

    if (state!.receiveMarketing) {
      state = state!.copyWith(receiveMarketing: false, allAgree: false);
    } else {
      if (state!.overFourteen &&
          state!.termsAndConditions &&
          state!.personalInformation) {
        allAgree = true;
      }
      state = state!.copyWith(receiveMarketing: true, allAgree: allAgree);
    }
  }
}

final joinProvider = StateNotifierProvider<JoinViewModel, JoinModel?>(
  (ref) {
    return JoinViewModel(JoinModel(), ref);
  },
);

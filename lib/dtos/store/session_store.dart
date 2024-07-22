import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SessionUser {
  String? accessToken;
  String? loginType;
  bool isLogin = false;

  SessionUser();
}

class SessionStore extends SessionUser {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  SessionStore(this.ref);

  Future<void> login(LoginRequestDTO requestDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(requestDTO);

    if (responseDTO.status == 200) {
      await secureStorage.write(key: "accessToken", value: accessToken);
      this.accessToken = accessToken;
      this.isLogin = true;
      this.loginType = "email";

      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainPage, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      print("카카오톡이 설치되어 있습니다");
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      print("카카오톡이 설치되어 있지 않습니다");
      try {
        // 1. 크리덴셜 로그인 - 토큰 받기
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();

        print('카카오계정으로 로그인 성공 ${token.accessToken}');

        // 2. 토큰(카카오)을 스프링서버에 전달하기 (스프링 서버한테 인증했다고 알려주기)
        var (responseDTO, accessToken) =
            await UserRepository().fetchKakaoLogin(token.accessToken);

        if (responseDTO.status == 200) {
          await secureStorage.write(key: "accessToken", value: accessToken);
          await secureStorage.write(
              key: "kakaoAccessToken", value: token.accessToken);
          this.accessToken = accessToken;
          this.isLogin = true;
          this.loginType = "kakao";

          Navigator.pushNamedAndRemoveUntil(
              mContext!, Move.mainPage, (route) => false);
        } else {
          ScaffoldMessenger.of(mContext!).showSnackBar(
              SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}")));
        }
      } catch (error) {
        ScaffoldMessenger.of(mContext!)
            .showSnackBar(SnackBar(content: Text("카카오 로그인 실패 : ${error}")));
      }
    }
  }
}

final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore(ref);
});

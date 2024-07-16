import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/dtos/repository/user_repository.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionUser {
  String? accessToken;
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

      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainPage, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}")));
    }
  }
}

final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore(ref);
});

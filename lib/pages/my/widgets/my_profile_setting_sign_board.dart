import 'package:flutter/material.dart';

class MyProfileSettingSignBoard extends StatelessWidget {
  const MyProfileSettingSignBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("SNS로 간편 가입한 경우 비밀번호 없이 로그인이 가능합니다."),
        ),
      ),
    );
  }
}

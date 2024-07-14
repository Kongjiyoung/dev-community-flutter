import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:dev_community/_core/constants/move.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인", style: inputTitleStyle(size: 25)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "이메일",
              style: inputTitleStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: authInputDeco(hintText: "example@publy.com"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "비밀번호",
              style: inputTitleStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: authInputDeco(hintText: "password"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Move.mainPage);
                },
                style: authBtnStyle(),
                child: const Text(
                    style: TextStyle(color: Colors.white), "이메일로 계속하기"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Move.mainPage,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "회원가입",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Text(
                  "비밀번호를 잊으셨나요?",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline, // 밑줄 설정
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

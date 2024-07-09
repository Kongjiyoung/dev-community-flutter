import 'package:dev_community/_core/constants/custom-widgets.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입", style: inputTitleStyle(size: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "이름",
              style: inputTitleStyle(),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: authInputDeco(hintText: "프로필 이름"),
            ),
            const SizedBox(height: 20),
            Text(
              "이메일",
              style: inputTitleStyle(),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: authInputDeco(hintText: "example@publyu.co"),
            ),
            const SizedBox(height: 20),
            Text(
              "비밀번호",
              style: inputTitleStyle(),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: authInputDeco(hintText: "영문, 숫자 포함 6자 이상"),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text("모두 동의"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text("(필수) 만 14세 이상입니다."),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text("(필수) 이용약관 동의"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text("(필수) 개인정보 수집 이용 동의"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text("(선택) 마케팅 정보 수신 동의"),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: authBtnStyle(),
                child: const Text("이메일로 시작하기",
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

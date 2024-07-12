import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/pages/auth/widgets/welcome-widgets/oauth_login_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(50, 50, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Title.png",
              width: 200, // 이미지의 너비 조절
              height: 100, // 이미지의 높이 조절
            ),
            Container(
              width: 300,
              child: Text(
                "요즘 개발자들의 필수 커뮤니티",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              width: 330,
              child: Text(
                "개발 트렌드부터 Q&A, 네트워킹까지 꼭 필요한 정보를 한 번에",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Spacer(), // 여기에 Spacer를 넣어 세로 공간을 확보합니다.
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column이 가능한 최소 크기만큼만 차지하도록 설정합니다.
          children: [
            OauthLoginButton("assets/images/naver_button.png"),
            SizedBox(height: 20),
            OauthLoginButton("assets/images/kakao_button.png"),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Move.loginPage);
              },
              child: Text(
                "다른방법으로시작하기",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

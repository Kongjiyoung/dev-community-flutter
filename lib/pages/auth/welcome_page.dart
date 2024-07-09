import 'package:dev_community/_core/constants/move.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 50, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Title.png",
              width: 200, // 이미지의 너비 조절
              height: 100, // 이미지의 높이 조절
            ),
            Text(
              "요즘 개발자들의 필수 \n커뮤니티",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "개발 트렌드부터 Q&A, 네트워킹까지\n꼭 필요한 정보를 한 번에",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
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
            GestureDetector(
              onTap: () {
                print("카카오톡 로그인");
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/kakao_button.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // 다른 방법으로 시작하기 클릭 시 동작
                print("다른 방법으로 시작하기");
              },
              child: Text(
                "다른 방법으로 시작하기",
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

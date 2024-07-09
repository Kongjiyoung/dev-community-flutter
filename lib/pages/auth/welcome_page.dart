import 'package:dev_community/_core/constants/move.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("/images/Title.png"),
            const Text("요즘 개발자들의 필수 \n커뮤니티"),
            const Text("개발 트렌드부터 Q&A, 네트워킹까지\n꼭 필요한 정보를 한 번에"),
            Image.asset("/images/kakao_button.png"),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Move.loginPage);
              },
              child: const Text("다른 방법으로 시작하기"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "로그인",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "이메일",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "example@publy.com" ,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "비밀번호",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "영문, 숫자 포함 6자 이상",
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFE0E0), // 배경색 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0), // 버튼 패딩 설정
                ),
                child: Text(style: TextStyle(color: Colors.white), "이메일로 계속하기"),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("고객센터",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline, // 밑줄 설정
                  ),
                ),
                Text("비밀번호를 잊으셨나요?",
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

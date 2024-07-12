import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "프로필 편집",
          style: inputTitleStyle(size: 25),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // 완료 버튼 눌렀을 때의 동작 정의
            },
            child: Text(
              '완료',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.red, // 배경색 설정
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 15.0), // 버튼 패딩 설정
            ),
          ),
          SizedBox(width: 25), // 아이콘 버튼과 다른 액션 사이에 공간 추가
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFF92b9d6),
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Color(0xFFc9dcea),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFcbd5e1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "이름",
              style: inputTitleStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: authInputDeco(hintText: "홍길동"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "대표직함",
              style: inputTitleStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: authInputDeco(hintText: "무슨대학교 무슨전공"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "자기소개",
              style: inputTitleStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "나를 소개해주세요.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

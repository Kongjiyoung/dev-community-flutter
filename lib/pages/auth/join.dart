import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("회원가입")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("이름"), Text("0/20")],
          ),
          TextFormField(
            decoration: InputDecoration(
                label: Text("프로필 이름"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          Text("이메일"),
          TextFormField(
            decoration: InputDecoration(
                label: Text("example@publyu.co"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          Text("비밀번호"),
          TextFormField(
            decoration: InputDecoration(
                label: Text("영문, 숫자 포함 6자 이상"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text("모두 동의"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text("(필수) 만 14세 이상입니다."),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text("(필수) 이용약관 동의"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text("(필수) 개인정보 수집 이용 동의"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text("(선택) 마케팅 정보 수신 동의"),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("이메일로 시작하기"))
        ],
      ),
    );
  }
}

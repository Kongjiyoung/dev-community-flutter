import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이메일", style:
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "example@publy.com",
                  ),
                ),
                Text("비밀번호"),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "영문, 숫자 포함 6자 이상",
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {

                  },
                      child: Text("이메일로 계속하기")
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("고객센터"),
                    Text("비밀번호를 잊으셨나요?"),
                  ],
                ),
              ],
        ),
      ),
    );
  }
}

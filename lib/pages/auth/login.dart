import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/dtos/store/session_store.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formkey = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("로그인", style: inputTitleStyle(size: 25)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
        child: Form(
          key: _formkey,
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
                controller: _email,
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
                controller: _password,
                decoration: authInputDeco(hintText: "password"),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String email = _email.text.trim();
                    String password = _password.text.trim();

                    SessionStore store = ref.read(sessionProvider);

                    store.login(LoginRequestDTO(email, password));
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
      ),
    );
  }
}

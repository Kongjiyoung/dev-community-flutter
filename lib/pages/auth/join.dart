import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/pages/auth/viewmodel/join_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinModel? model = ref.watch(joinProvider);
    JoinViewModel viewModel = ref.read(joinProvider.notifier);

    final _formKey = GlobalKey<FormState>();
    final _nickname = TextEditingController(text: "jointest");
    final _email = TextEditingController(text: "test@nate.com");
    final _password = TextEditingController(text: "1234");

    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입", style: inputTitleStyle(size: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "이름",
                style: inputTitleStyle(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nickname,
                decoration: authInputDeco(hintText: "프로필 이름"),
              ),
              const SizedBox(height: 20),
              Text(
                "이메일",
                style: inputTitleStyle(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _email,
                decoration: authInputDeco(hintText: "example@publyu.co"),
              ),
              const SizedBox(height: 20),
              Text(
                "비밀번호",
                style: inputTitleStyle(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _password,
                decoration: authInputDeco(hintText: "영문, 숫자 포함 6자 이상"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: model!.allAgree,
                    onChanged: (value) {
                      viewModel.agreeAll();
                    },
                  ),
                  Text("모두 동의"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: model.overFourteen,
                    onChanged: (value) {
                      viewModel.agreeOverFourteen();
                    },
                  ),
                  Text("(필수) 만 14세 이상입니다."),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: model.termsAndConditions,
                    onChanged: (value) {
                      viewModel.agreeTermsAndConditions();
                    },
                  ),
                  Text("(필수) 이용약관 동의"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: model.personalInformation,
                    onChanged: (value) {
                      viewModel.agreePersonalInformation();
                    },
                  ),
                  Text("(필수) 개인정보 수집 이용 동의"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: model.receiveMarketing,
                    onChanged: (value) {
                      viewModel.agreeReceiveMarketing();
                    },
                  ),
                  Text("(선택) 마케팅 정보 수신 동의"),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    JoinRequestDTO joinRequestDTO = JoinRequestDTO(
                        _nickname.text.trim(),
                        _email.text.trim(),
                        _password.text.trim());

                    viewModel.join(joinRequestDTO);
                  },
                  style: authBtnStyle(),
                  child: const Text("이메일로 시작하기",
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dev_community/_core/constants/line.dart';
import 'package:dev_community/pages/my/widgets/my_profile_setting_edit_button.dart';
import 'package:dev_community/pages/my/widgets/my_profile_setting_info.dart';
import 'package:dev_community/pages/my/widgets/my_profile_setting_input.dart';
import 'package:dev_community/pages/my/widgets/my_profile_setting_sign_board.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내 프로필"),
      ),
      body: ListView(
        children: [
          ProfileSettingInfo(),
          list_line(),
          MyProfileSettingInput("이메일 :", "example@nate.com"),
          list_line(),
          MyProfileSettingInput("비밀번호 :", "password"),
          SizedBox(height: 20),
          MyProfileSettingSignBoard(),
          MyProfileSettingEditButton()
        ],
      ),
    );
  }
}

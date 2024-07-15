import 'package:dev_community/pages/my/widgets/my_edit_btn.dart';
import 'package:dev_community/pages/my/widgets/my_info.dart';
import 'package:flutter/material.dart';

class MyProfileSliverHeaderData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            MyInfo(
              nickname: "지영",
              introduce: "그냥대학교 컴퓨터공학과",
            ),
            SizedBox(
              width: double.infinity,
              child: MyEditBtn(),
            ),
          ],
        ),
      ),
    );
  }
}

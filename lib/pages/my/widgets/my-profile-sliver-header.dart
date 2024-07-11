import 'package:dev_community/pages/my/widgets/my-edit-btn.dart';
import 'package:dev_community/pages/my/widgets/my-info.dart';
import 'package:flutter/material.dart';

class MyProfileSliverHeader extends StatelessWidget {
  MyProfileSliverHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyInfo(),
        Spacer(),
        SizedBox(
          width: double.infinity,
          child: MyEditBtn(),
        ),
      ],
    );
  }
}

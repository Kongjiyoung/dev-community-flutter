import 'package:dev_community/pages/my/widgets/my_edit_btn.dart';
import 'package:dev_community/pages/my/widgets/my_info.dart';
import 'package:flutter/material.dart';

class MyProfileSliverHeaderData extends StatelessWidget {
  MyProfileSliverHeaderData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            MyInfo(),
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

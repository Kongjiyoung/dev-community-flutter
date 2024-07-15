import 'package:dev_community/pages/my/widgets/my_info.dart';
import 'package:flutter/material.dart';

class ProfileDetailSliverAdapter extends StatelessWidget {
  const ProfileDetailSliverAdapter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          children: [
            MyInfo(nickname: "승진"),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Text(
                  "게시물 10",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyProfileTabBarView extends StatelessWidget {
  const MyProfileTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("제목${index}"),
              subtitle: Text("내용${index}"),
              trailing: Text("날짜${index}"),
            );
          },
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("댓글${index}"),
              subtitle: Text("글 제목${index}"),
              trailing: Text("날짜${index}"),
            );
          },
        ),
      ],
    );
  }
}

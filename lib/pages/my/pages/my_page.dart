import 'package:dev_community/pages/my/widgets/my-profile-sliver-app-bar.dart';
import 'package:dev_community/pages/my/widgets/my_profile_tab_bar_view.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MyProfileSliverAppBar(),
          ];
        },
        body: MyProfileTabBarView(),
      ),
    );
  }
}

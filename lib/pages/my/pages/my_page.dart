import 'dart:math';

import 'package:dev_community/pages/my/widgets/my-profile-sliver-app-bar.dart';
import 'package:dev_community/pages/my/widgets/my_profile_sliver_header.dart';
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
            SliverPadding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              sliver: SliverPersistentHeader(
                  delegate: _SliverMyPageHeaderDelegate(
                      // SliverPersistentHeaderDelegate 타입을 요구하지만 추상 클래스이기 때문에 상속 받는 클래스 별도로 생성 필요
                      minHeight: 180,
                      maxHeight: 180,
                      child: MyProfileSliverHeaderData())),
            ),
            MyProfileSliverAppBar(),
          ];
        },
        body: MyProfileTabBarView(),
      ),
    );
  }
}

// SliverPersistentHeader 에 필수로 들어가야하는 Delegate
class _SliverMyPageHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverMyPageHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child; // 헤더에 넣을 위젯
  }

  @override
  double get maxExtent => max(minHeight, maxHeight); // 헤더의 최대 사이즈

  @override
  double get minExtent => minHeight; // 헤더의 최소 사이즈

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // 헤더의 상태변경을 인지하고 rebuild 하는 기능
  }
}

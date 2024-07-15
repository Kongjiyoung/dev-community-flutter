import 'package:dev_community/pages/my/widgets/my_profile_sliver_header.dart';
import 'package:flutter/material.dart';

class MyProfileSliverAppBar extends StatelessWidget {
  const MyProfileSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 20,
      expandedHeight: 220,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(background: MyProfileSliverHeaderData()),
      bottom: TabBar(
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey[300],
        tabs: [
          Tab(child: Text("게시물", style: TextStyle(fontSize: 20))),
          Tab(child: Text("댓글", style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}

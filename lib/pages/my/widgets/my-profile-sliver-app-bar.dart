import 'package:flutter/material.dart';

class MyProfileSliverAppBar extends StatelessWidget {
  const MyProfileSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
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

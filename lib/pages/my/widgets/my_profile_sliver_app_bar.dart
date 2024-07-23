import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/pages/my/widgets/my_profile_sliver_header.dart';
import 'package:flutter/material.dart';

class MyProfileSliverAppBar extends StatelessWidget {
  final MyPageDTO myPageDTO;

  MyProfileSliverAppBar(this.myPageDTO);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 20,
      expandedHeight: 350,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace:  FlexibleSpaceBar(
          background: Column(
            children: [
              SizedBox(height: 70.0), // 원하는 높이를 설정하세요
              MyProfileSliverHeaderData(
                profileImage: myPageDTO.image,
                nickname: myPageDTO.nickname,
                introduce: myPageDTO.introduce,
                position: myPageDTO.position,
              ),
            ],
          ),
      ),
      bottom: TabBar(
        onTap: (value) {},
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

import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:flutter/material.dart';

class MyProfileTabBarView extends StatelessWidget {
  final MyPageDTO myPageDTO;

  MyProfileTabBarView(this.myPageDTO);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        myPageDTO.myBoardList.isEmpty
            ? Center(child: Text("작성한 게시물 없음"))
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myPageDTO.myBoardList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("${myPageDTO.myBoardList[index].title}"),
                      trailing:
                          Text("${myPageDTO.myBoardList[index].updatedAt}"),
                    ),
                  );
                },
              ),
        myPageDTO.myReplyList.isEmpty
            ? Center(child: Text("작성한 댓글 없음"))
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myPageDTO.myReplyList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("${myPageDTO.myReplyList[0].comment}"),
                      subtitle: Text("글 제목${index}"),
                      trailing: Text("날짜${index}"),
                    ),
                  );
                }),
      ],
    );
  }
}

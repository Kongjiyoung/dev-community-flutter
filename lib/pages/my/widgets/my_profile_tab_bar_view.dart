import 'package:dev_community/_core/util/string_convertor.dart';
import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/pages/my/viewmodel/my_page_viewmodel.dart';
import 'package:flutter/material.dart';

class MyProfileTabBarView extends StatefulWidget {
  final MyPageDTO myPageDTO;
  final MyPageViewmodel myPageViewmodel;

  MyProfileTabBarView({required this.myPageDTO, required this.myPageViewmodel});

  @override
  _MyProfileTabBarViewState createState() => _MyProfileTabBarViewState();
}

class _MyProfileTabBarViewState extends State<MyProfileTabBarView> {
  late ScrollController boardScrollController;
  late ScrollController replyScrollController;

  @override
  void initState() {
    super.initState();
    boardScrollController = ScrollController()
      ..addListener(() {
        if (boardScrollController.position.pixels ==
            boardScrollController.position.maxScrollExtent) {
          widget.myPageViewmodel.getListForTab("boards");
        }
      });

    replyScrollController = ScrollController()
      ..addListener(() {
        if (replyScrollController.position.pixels ==
            replyScrollController.position.maxScrollExtent) {
          widget.myPageViewmodel.getListForTab("replies");
        }
      });
  }

  @override
  void dispose() {
    boardScrollController.dispose();
    replyScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        widget.myPageDTO.myBoardList.isEmpty
            ? Center(child: Text("작성한 게시물 없음"))
            : ListView.builder(
                controller: boardScrollController,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.myPageDTO.myBoardList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      title:
                          Text("${widget.myPageDTO.myBoardList[index].title}"),
                      trailing: Text(
                          "${widget.myPageDTO.myBoardList[index].updatedAt}"),
                    ),
                  );
                },
              ),
        widget.myPageDTO.myReplyList.isEmpty
            ? Center(child: Text("작성한 댓글 없음"))
            : ListView.builder(
                controller: replyScrollController,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.myPageDTO.myReplyList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(maxStringLength(
                          20, widget.myPageDTO.myReplyList[index].comment)),
                      subtitle:
                          Text(widget.myPageDTO.myReplyList[index].boardTitle),
                      trailing:
                          Text(widget.myPageDTO.myReplyList[index].updatedAt),
                    ),
                  );
                }),
      ],
    );
  }
}

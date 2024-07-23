import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/_core/constants/line.dart';
import 'package:dev_community/dtos/user/user_response.dart';
import 'package:flutter/material.dart';

class ProfileDetailSliverList extends StatelessWidget {
  final userNickName;
  final userPosition;
  final userImage;
  final List<UserBoardListDTO> userBoardList;

  ProfileDetailSliverList(
      {required this.userBoardList,
      required this.userImage,
      required this.userNickName,
      required this.userPosition});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          UserBoardListDTO board = userBoardList[index];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: userBoardList.isEmpty
                    ? Center(
                        child: Text("작성한 게시물이 없습니다."),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Image.network(
                                        serverAddress + userImage),
                                    height: 50,
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      Text(userNickName),
                                      Text(userPosition),
                                    ],
                                  ),
                                ],
                              ),
                              Text(board.createdAt),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(board.title),
                            alignment: Alignment.topLeft,
                            height: 200,
                          ),
                        ],
                      ),
              ),
              list_line(10.0),
            ],
          );
        },
        childCount: userBoardList.length, // ListView.builder의 아이템 수
      ),
    );
  }
}

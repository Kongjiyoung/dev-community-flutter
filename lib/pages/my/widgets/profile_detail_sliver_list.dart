import 'package:dev_community/_core/constants/line.dart';
import 'package:flutter/material.dart';

class ProfileDetailSliverList extends StatelessWidget {
  const ProfileDetailSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Image.asset("assets/images/profile.jpeg"),
                              height: 50,
                              width: 50,
                            ),
                            Column(
                              children: [
                                Text("승진"),
                                Text("커리어 코치"),
                              ],
                            ),
                          ],
                        ),
                        Text("${index}시간 전"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                          "글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 "),
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
        childCount: 10, // ListView.builder의 아이템 수
      ),
    );
  }
}

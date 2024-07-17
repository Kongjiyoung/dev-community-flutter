import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../board/detail_page.dart';

class BuildPost extends StatelessWidget {
  final int boardId;
  final String name;
  final String? job;
  final String time;
  final String title;
  final String content;
  final String profileImage;
  final views;
  final loveCount;
  final replyCount;
  final bookmarkCount;
  final bool isLove;
  final bool isBookmark;

  const BuildPost({
    required this.boardId,
    required this.name,
    required this.job,
    required this.time,
    required this.title,
    required this.content,
    required this.profileImage,
    required this.views,
    required this.loveCount,
    required this.replyCount,
    required this.bookmarkCount,
    required this.isLove,
    required this.isBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      color: Color(0xFFF5FEF5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardDetailPage(boardId), //프로필페이지로 바꾸기
                ),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImage),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(job ?? "없음"),
                  ],
                ),
                Spacer(),
                Text(time),
              ],
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardDetailPage(boardId),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: content,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: "더보기",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoardDetailPage(boardId),
                              ),
                            );
                          },
                      ),
                    ],
                    text: content.length > 40
                        ? content.substring(0, 40)+ "..."
                        : content,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Row(
            children: [
              Text("조회 "),
              Text("${views}"),
              Spacer(),
              TextButton(
                onPressed: () {
                  // 댓글 아이콘 클릭 시 실행될 코드
                },
                child: Row(
                  children: [
                    if (isLove)
                      Icon(
                        Icons.favorite,
                        color: Color(0xFFafe897),
                      )
                    else
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xFFafe897),
                      ),
                    Text(
                      "${loveCount}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff323b27),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // 댓글 아이콘 클릭 시 실행될 코드
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.comment,
                      color: Color(0xFFafe897),
                    ),
                    Text(
                      "${replyCount}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff323b27),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // 저장 아이콘 클릭 시 실행될 코드
                },
                child: Row(
                  children: [
                    if (isBookmark)
                      Icon(
                        Icons.bookmark,
                        color: Color(0xFFafe897),
                      )
                    else
                      Icon(
                        Icons.bookmark_add_outlined,
                        color: Color(0xFFafe897),
                      ),
                    Text(
                      "${bookmarkCount}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff323b27),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

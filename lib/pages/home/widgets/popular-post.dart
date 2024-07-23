import 'package:flutter/material.dart';

import '../../board/detail_page.dart';

class PopularPost extends StatelessWidget {
  final boardId;
  final String name;
  final String? job;
  final String title;
  final int rank;
  final String userImage;

  const PopularPost({
    required this.boardId,
    required this.name,
    required this.job,
    required this.title,
    required this.rank,
    required this.userImage,
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
                  builder: (context) => BoardDetailPage(boardId),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF4B5A6A), // 배경색 설정
                        borderRadius: BorderRadius.circular(20), // 모서리 곡률 설정
                      ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'TOP',
                              style: TextStyle(
                                color: Colors.white, // 텍스트 색상
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8), // 간격 조정을 위해 SizedBox 추가
                            Text(
                              "${rank}",
                              style: TextStyle(
                                color: Colors.white, // 텍스트 색상
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),

                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              job ?? "없음",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff676767),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(userImage),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

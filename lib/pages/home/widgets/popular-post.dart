import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../board/detail_page.dart';

class PopularPost extends StatelessWidget {
  final String name;
  final String job;
  final String title;

  const PopularPost({
    super.key,
    required this.name,
    required this.job,
    required this.title,
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
                  builder: (context) => BoardDetailPage(),
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
                      child: Text(
                        'TOP 1',
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색상
                          fontWeight: FontWeight.bold,
                        ),
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
                              job,
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
                      backgroundImage: AssetImage("assets/images/logo.png"),
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

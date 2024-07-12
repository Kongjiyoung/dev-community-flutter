import 'package:dev_community/pages/board/detail_page.dart';
import 'package:dev_community/pages/board/save_page.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            SizedBox(width: 10), // 로고와 검색바 사이의 간격
            Expanded(
              child: Container(
                height: 40, // 원하는 높이로 설정
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Enter text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    // backgroundColor: Color(0xffd3ffba), // 배경색 설정
                    side: BorderSide(color: Color(0xff727a72), width: 1.0),
                    // 테두리 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.whatshot,
                        color: Color(0xfffa8783),
                      ),
                      const Text(
                        "인기글",
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    // backgroundColor: Color(0xffd3ffba), // 배경색 설정
                    side: BorderSide(color: Color(0xff727a72), width: 1.0),
                    // 테두리 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Color(0xfffa8783),
                      ),
                      const Text(
                        "저장한 게시물",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BuildPost(
            name: "공지영",
            job: "신입개발자",
            time: "3시간 전",
            title: "제목 : FlashAttention3 공개",
            content: "내용 : LLM의 속도 향상을 위해서 최근에 많은 방법들이 시도되고 있는데요,.. ",
            views: "조회 698",
          ),
          SizedBox(height: 10),
          BuildPost(
            name: "공지영",
            job: "신입개발자",
            time: "3시간 전",
            title: "제목 : FlashAttention3 공개",
            content: "내용 : LLM의 속도 향상을 위해서 최근에 많은 방법들이 시도되고 있는데요,.. ",
            views: "조회 698",
          ),
          SizedBox(height: 10),
          BuildPost(
            name: "공지영",
            job: "신입개발자",
            time: "3시간 전",
            title: "제목 : FlashAttention3 공개",
            content: "내용 : LLM의 속도 향상을 위해서 최근에 많은 방법들이 시도되고 있는데요,.. ",
            views: "조회 698",
          ),
          SizedBox(height: 10),
          BuildPost(
            name: "공지영",
            job: "신입개발자",
            time: "3시간 전",
            title: "제목 : FlashAttention3 공개",
            content: "내용 : LLM의 속도 향상을 위해서 최근에 많은 방법들이 시도되고 있는데요,.. ",
            views: "조회 698",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SavePage(),
            ),
          );
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff7adc5a),
      ),
    );
  }
}

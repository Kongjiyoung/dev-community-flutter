import 'dart:convert';

import 'package:dev_community/pages/board/save_page.dart';
import 'package:dev_community/pages/home/popular-post-page.dart';
import 'package:dev_community/pages/home/saved-post-page.dart';
import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {

  late quill.QuillController _quillController;


  void loadContent(String jsonString) {
    var document = quill.Document.fromJson(jsonDecode(jsonString));
    _quillController = quill.QuillController(
      document: document,
      selection: TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeModel? model = ref.watch(homeBoardListProvider);

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
      body: model == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PopularPostPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          // backgroundColor: Color(0xffd3ffba), // 배경색 설정
                          side:
                              BorderSide(color: Color(0xff727a72), width: 1.0),
                          // 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // 둥근 모서리 설정
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SavedPostPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          side:
                              BorderSide(color: Color(0xff727a72), width: 1.0),
                          // 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // 둥근 모서리 설정
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
                Expanded(
                  child: ListView.builder(
                    itemCount: model!.contentList!.length,
                    itemBuilder: (context, index) {

                      final post = model.contentList![index];
                      loadContent(post.boardContent); // Quill 컨트롤러를 초기화

                      return Column(
                        children: [
                          BuildPost(
                            boardId: post.boardId,
                            name: post.userNickname!,
                            job: post.userPosition,
                            time: post.boardCreatedAtDuration!,
                            title: post.boardTitle!,
                            content: _quillController!,
                            profileImage: post.userImage,
                            views: post.boardHit!,
                            loveCount: post.likeCount!,
                            replyCount: post.replyCount!,
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
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

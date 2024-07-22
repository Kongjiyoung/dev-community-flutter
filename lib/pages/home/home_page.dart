import 'dart:convert';

import 'package:dev_community/pages/board/save_page.dart';
import 'package:dev_community/pages/home/popular_post_page.dart';
import 'package:dev_community/pages/home/saved_post_page.dart';
import 'package:dev_community/pages/home/search_result_page.dart';
import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/build-post.dart';
import 'package:dev_community/pages/home/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeModel? model = ref.watch(homeBoardListProvider);
    HomeViewmodel viewmodel = ref.read(homeBoardListProvider.notifier);
    TextEditingController searchController = TextEditingController();


    void _performSearch(String query) {
      if (query.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultsPage(query: query),
          ),
        );
      }
    }

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
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Enter text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  style: TextStyle(color: Colors.black),
                  onSubmitted: (query) {
                    _performSearch(query);
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _performSearch(searchController.text);
              },
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
                PostView(
                  contentList: model!.contentList,
                  homeViewmodel: viewmodel,
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SavePage(viewmodel),
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

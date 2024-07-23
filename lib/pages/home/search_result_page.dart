import 'package:dev_community/pages/home/widgets/SearchPostView.dart';
import 'package:dev_community/pages/home/widgets/post_view.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String query;

  SearchResultsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: FutureBuilder<List<String>>(
        future: performSearch(query), // 여기에 실제 검색 로직을 추가하세요.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No results found'));
          } else {
            return Center(child: Text('No results found'));
            // return SearchPostView(
            //   contentList: model!.contentList,
            //   homeViewmodel: viewmodel,
            // );
          }
        },
      ),
    );
  }

  Future<List<String>> performSearch(String query) async {
    await Future.delayed(Duration(seconds: 2));
    return List<String>.generate(10, (index) => 'Result $index for "$query"');
  }
}
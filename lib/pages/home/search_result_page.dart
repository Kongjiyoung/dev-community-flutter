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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<String>> performSearch(String query) async {
    // 여기에 검색 로직을 추가하세요. 현재는 예시 데이터로 대체됩니다.
    await Future.delayed(Duration(seconds: 2)); // 검색 중인 것처럼 보이기 위해 지연 추가
    return List<String>.generate(10, (index) => 'Result $index for "$query"');
  }
}

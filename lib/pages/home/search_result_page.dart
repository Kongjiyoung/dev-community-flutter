import 'package:dev_community/pages/home/viewmodel/search_post_viewmodel.dart';
import 'package:dev_community/pages/home/widgets/search_post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultsPage extends ConsumerWidget {
  final String query;

  SearchResultsPage({required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchPostModel? model = ref.watch(searchPostProvider(query));
    SearchPostViewmodel viewmodel =
        ref.read(searchPostProvider(query).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: model == null
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black26)))
          : model!.searchBoardListDTO.isEmpty
              ? Center(
                  child: Text("게시물이 없습니다."),
                )
              : SearchPostView(
                  searchBoardList: model!.searchBoardListDTO,
                  searchPostViewmodel: viewmodel,
                ),
    );
  }
}

import 'package:dev_community/dtos/repository/book_mark_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkManager extends StateNotifier<bool> {
  BookmarkManager(bool initialState) : super(initialState);

  Future<void> toggleBookmark(int boardId) async {
    if (state == true) {
      await BookMarkRepository().bookMarkDelete(boardId);
    } else {
      await BookMarkRepository().bookMarkSave(boardId);
    }

    state = !state;
  }
}

final bookmarkManagerProvider =
StateNotifierProvider.family<BookmarkManager, bool, bool>((ref, initialState) => BookmarkManager(initialState));

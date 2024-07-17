import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkManager extends StateNotifier<bool> {
  BookmarkManager() : super(false);

  void toggleBookmark() {
    state = !state;
  }
}

final bookmarkManagerProvider = StateNotifierProvider<BookmarkManager, bool>((ref) => BookmarkManager());

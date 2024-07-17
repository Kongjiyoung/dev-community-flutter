import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeManager extends StateNotifier<bool> {
  LikeManager() : super(false);

  void toggleLike() {
    state = !state;
  }
}

final likeManagerProvider = StateNotifierProvider<LikeManager, bool>((ref) => LikeManager());

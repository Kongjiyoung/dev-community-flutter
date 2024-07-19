import 'package:dev_community/pages/my/viewmodel/my_page_viewmodel.dart';
import 'package:dev_community/pages/my/widgets/my-profile-sliver-app-bar.dart';
import 'package:dev_community/pages/my/widgets/my_profile_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyPageModel? model = ref.watch(myPageProvider);
    MyPageViewmodel viewmodel = ref.read(myPageProvider.notifier);

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MyProfileSliverAppBar(model!.myPageDTO),
          ];
        },
        body: MyProfileTabBarView(model!.myPageDTO),
      ),
    );
  }
}

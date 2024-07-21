import 'package:dev_community/pages/my/viewmodel/my_page_viewmodel.dart';
import 'package:dev_community/pages/my/widgets/my_profile_sliver_app_bar.dart';
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
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          bool hasInitialized = false;
          if (!tabController.hasListeners) {
            tabController.addListener(() {
              if (tabController.indexIsChanging && !hasInitialized) {
                hasInitialized = true; // 호출 후 플래그 설정
                if (tabController.index == 1) {
                  viewmodel.getListForTab("replies");
                }
              }
            });
          }

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                MyProfileSliverAppBar(model!.myPageDTO),
              ];
            },
            body: MyProfileTabBarView(
              myPageDTO: model!.myPageDTO,
              myPageViewmodel: viewmodel,
            ),
          );
        },
      ),
    );
  }
}

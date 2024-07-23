import 'package:dev_community/pages/my/viewmodel/profile_detail_viewmodel.dart';
import 'package:dev_community/pages/my/widgets/profile_detail_sliver_adapter.dart';
import 'package:dev_community/pages/my/widgets/profile_detail_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetail extends ConsumerWidget {
  final userId;

  ProfileDetail(this.userId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileDetailModel? model = ref.watch(profileDetailProvider(userId));

    return Scaffold(
      appBar: AppBar(),
      body: model == null
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                ProfileDetailSliverAdapter(
                  nickname: model!.userProfileDetailDTO.nickname,
                  boardCount: model.userProfileDetailDTO.totalBoardCount,
                  introduce: model.userProfileDetailDTO.introduce!,
                  position: model.userProfileDetailDTO.position!,
                  profileImage: model.userProfileDetailDTO.image,
                ),
                ProfileDetailSliverList(
                  userNickName: model.userProfileDetailDTO.nickname,
                  userImage: model.userProfileDetailDTO.image,
                  userPosition: model.userProfileDetailDTO.position,
                  userBoardList: model.userProfileDetailDTO.userBoardList,
                ),
              ],
            ),
    );
  }
}

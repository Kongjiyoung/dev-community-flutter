import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/store/session_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfo extends ConsumerWidget {
  final String? profileImage;
  final String nickname;
  final String? position;
  final String? introduce;

  MyInfo({
    this.profileImage,
    required this.nickname,
    this.position,
    this.introduce,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore sessionStore = ref.read(sessionProvider);

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(serverAddress + profileImage!),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nickname, style: inputTitleStyle(size: 25)),
                SizedBox(height: 10),
                Text(position!, style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          height: 125,
          alignment: AlignmentDirectional.topStart,
          child: Text(introduce!),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/_core/util/image_parse_util.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/pages/my/viewmodel/profile_update_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdatePage extends ConsumerWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileUpdateModel? model = ref.watch(profileUpdateProvider);
    ProfileUpdateViewmodel viewmodel = ref.read(profileUpdateProvider.notifier);
    final _formKey = GlobalKey<FormState>();

    late final nicknameController =
        TextEditingController(text: model!.updateProfileDTO.nickname);
    late final positionController =
        TextEditingController(text: model!.updateProfileDTO.position);
    late final introduceController =
        TextEditingController(text: model!.updateProfileDTO.introduce);

    if (model == null) {
      return const Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black26)));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "프로필 편집",
            style: inputTitleStyle(size: 25),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String? imageFile;
                String? imageName;
                ImageDTO? imageDTO;
                if (model.selectedImage != null) {
                  imageFile = await encodeXFileToBase64(model.selectedImage!);
                  imageName = model.selectedImage!.path;
                  imageDTO =
                      ImageDTO(imageData: imageFile, fileName: imageName);
                }

                UpdateProfileRequestDTO requestDTO = UpdateProfileRequestDTO(
                  nickname: nicknameController.text,
                  introduce: introduceController.text,
                  position: positionController.text,
                  profileImg: imageDTO,
                );
                viewmodel.updateProfile(requestDTO);
              },
              child: Text(
                '완료',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffa2d594), // 배경색 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0), // 버튼 패딩 설정
              ),
            ),
            SizedBox(width: 25), // 아이콘 버튼과 다른 액션 사이에 공간 추가
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _showImagePickerOptions(context, viewmodel),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Color(0xFF92b9d6),
                          backgroundImage: model.selectedImage == null
                              ? NetworkImage(serverAddress +
                                  model!.updateProfileDTO.profileImg!)
                              : FileImage(File(model.selectedImage!.path))
                                  as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFcbd5e1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "이름",
                    style: inputTitleStyle(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nicknameController,
                    decoration: authInputDeco(hintText: "홍길동"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "대표직함",
                    style: inputTitleStyle(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: positionController,
                    decoration: authInputDeco(hintText: "무슨대학교 무슨전공"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "자기소개",
                    style: inputTitleStyle(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: introduceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "나를 소개해주세요.",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void _showImagePickerOptions(
      BuildContext context, ProfileUpdateViewmodel viewmodel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('카메라'),
                  onTap: () {
                    viewmodel.editProfileImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('갤러리'),
                  onTap: () {
                    viewmodel.editProfileImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text('취소'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

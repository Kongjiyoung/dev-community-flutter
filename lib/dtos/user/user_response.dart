class UpdateProfileDTO {
  final String nickname;
  final String? position;
  final String? introduce;
  final String? profileImg;

  UpdateProfileDTO({
    required this.nickname,
    this.position,
    this.introduce,
    this.profileImg,
  });

  factory UpdateProfileDTO.fromJson(Map<String, dynamic> json) {
    return UpdateProfileDTO(
      nickname: json["nickname"],
      position: json["position"] ?? "",
      introduce: json["introduce"] ?? "",
      profileImg: json["profileImg"],
    );
  }
}

class UserProfileDetailDTO {
  final int id;
  final String image;
  final String nickname;
  final String? position;
  final String? introduce;
  final int totalBoardCount;
  final List<UserBoardListDTO> userBoardList;

  UserProfileDetailDTO({
    required this.id,
    required this.image,
    required this.nickname,
    this.position,
    this.introduce,
    required this.totalBoardCount,
    required this.userBoardList,
  });

  factory UserProfileDetailDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevList = json["userBoardList"];

    return UserProfileDetailDTO(
      id: json["id"],
      image: json["image"],
      nickname: json["nickname"],
      position: json["position"] ?? "포지션 없음",
      introduce: json["introduce"] ?? "소개 없음",
      totalBoardCount: json["totalBoardCount"],
      userBoardList:
          prevList.map((board) => UserBoardListDTO.fromJson(board)).toList(),
    );
  }
//
}

class UserBoardListDTO {
  final int id;
  final String title;
  final String content;
  final String createdAt;

  UserBoardListDTO({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory UserBoardListDTO.fromJson(Map<String, dynamic> json) {
    return UserBoardListDTO(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      createdAt: json["createdAt"],
    );
  }
//
}

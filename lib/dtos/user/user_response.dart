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
//
}

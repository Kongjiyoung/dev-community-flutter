class LoginRequestDTO {
  final String email;
  final String password;

  LoginRequestDTO(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "password": this.password,
    };
  }
}

class JoinRequestDTO {
  final String nickname;
  final String email;
  final String password;

  JoinRequestDTO(this.nickname, this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      "nickname": this.nickname,
      "email": this.email,
      "password": this.password,
    };
  }
}

class UpdateProfileRequestDTO {
  final String nickname;
  final String? position;
  final String? introduce;
  final ImageDTO? profileImg;

  UpdateProfileRequestDTO({
    required this.nickname,
    this.position,
    this.introduce,
    this.profileImg,
  });

  Map<String, dynamic> toJson() {
    return {
      "nickname": this.nickname,
      "position": this.position,
      "introduce": this.introduce,
      "profileImg": this.profileImg,
    };
  }
}

class ImageDTO {
  final String imageData;
  final String fileName;

  ImageDTO({
    required this.imageData,
    required this.fileName,
  });

  Map<String, dynamic> toJson() {
    return {
      "imageData": this.imageData,
      "fileName": this.fileName,
    };
  }
}

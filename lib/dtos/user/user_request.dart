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

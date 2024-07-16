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

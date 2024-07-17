import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/dtos/user/user_request.dart';

class UserRepository {
  Future<(ResponseDTO, String)> fetchLogin(LoginRequestDTO loginReqDTO) async {
    final response =
        await dio.post("/api/users/login", data: loginReqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      final accessToken = response.headers["Authorization"]!.first;

      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }

  Future<ResponseDTO> fetchJoin(JoinRequestDTO joinRequestDTO) async {
    final response =
        await dio.post("/api/users/join", data: joinRequestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      return responseDTO;
    } else {
      return responseDTO;
    }
  }
}

import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/dtos/user/user_request.dart';

class UserRepository {
  // 로그인
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

  // 회원가입
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

// 마이페이지 view
  Future<ResponseDTO> fetchMyPage({int? page, String? type}) async {
    final response = await dio.get("/api/users/mypage",
        queryParameters: {"page": page, "type": type});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      MyPageDTO myPageDTO = MyPageDTO.fromJson(responseDTO.body);
      print("Repository : ${myPageDTO.nickname}");
      responseDTO.body = myPageDTO;
    }

    return responseDTO;
  }
}

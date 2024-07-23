import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/mypage/my_page_response.dart';
import 'package:dev_community/dtos/response_dto.dart';
import 'package:dev_community/dtos/user/user_request.dart';
import 'package:dev_community/dtos/user/user_response.dart';

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

  Future<(ResponseDTO, String)> fetchKakaoLogin(String accessToken) async {
    final response = await dio.get("/api/users/oauth/kakao",
        queryParameters: {"accessToken": accessToken});

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
      switch (type) {
        case "boards":
          {
            List<dynamic> prevBoardList = responseDTO.body;
            List<MyBoardList> newBoardList = prevBoardList
                .map((board) => MyBoardList.fromJson(board))
                .toList();
            responseDTO.body = newBoardList;
          }
        case "replies":
          {
            List<dynamic> prevReplyList = responseDTO.body;
            List<MyReplyList> newReplyList = prevReplyList
                .map((reply) => MyReplyList.fromJson(reply))
                .toList();
            responseDTO.body = newReplyList;
          }
        default:
          {
            MyPageDTO myPageDTO = MyPageDTO.fromJson(responseDTO.body);
            responseDTO.body = myPageDTO;
          }
      }
    }

    return responseDTO;
  }

  // 프로필 편집 view
  Future<ResponseDTO> fetchEditProfileView() async {
    final response = await dio.get("/api/users/profile/update");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      responseDTO.body = UpdateProfileDTO.fromJson(responseDTO.body);
    }

    return responseDTO;
  }

  // 프로필 편집
  Future<ResponseDTO> fetchUpdateProfile(
      UpdateProfileRequestDTO requestDTO) async {
    final response =
        await dio.put("/api/users/profile/update", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      responseDTO.body = UpdateProfileDTO.fromJson(responseDTO.body);
    }

    return responseDTO;
  }
}

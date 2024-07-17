import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/response_dto.dart';

class BoardRepository {
  Future<ResponseDTO> fetchBoardList({int page = 1}) async {
    final response = await dio.get("/api/boards/list?page=${page}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevContentList = responseDTO.body["content"];

      List<Content> newContentList =
          prevContentList.map((content) => Content.fromJson(content)).toList();

      responseDTO.body = newContentList;
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchPopularBoardList({int page = 1}) async {
    final response = await dio.get("/api/boards/top10List");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevContentList = responseDTO.body;

      List<TopTenContent> newContentList =
      prevContentList.map((content) => TopTenContent.fromJson(content)).toList();

      responseDTO.body = newContentList;
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchBoardDetail({int boardId = 1}) async {
    try {
      final response = await dio.get("/api/boards/${boardId}/detail");

      if (response.statusCode == 200) {
        // 서버에서 받은 데이터를 ResponseDTO로 변환
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

        // 필요한 추가 데이터 처리
        if (responseDTO.status == 200) {
          // replies 항목이 있는 경우에만 처리
          if (responseDTO.body.containsKey("replies")) {
            List<dynamic> replyList = responseDTO.body["replies"];
            List<ReplyDTO> newReplyList = replyList.map((reply) => ReplyDTO.fromJson(reply)).toList();
            responseDTO.body["replies"] = newReplyList; // body에 새로운 replies 리스트 할당
          }
        }

        // 변환된 데이터를 반환
        return responseDTO;
      } else {
        throw Exception('Failed to fetch board detail');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

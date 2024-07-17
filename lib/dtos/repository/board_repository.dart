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
}

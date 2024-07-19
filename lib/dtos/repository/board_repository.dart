import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/response_dto.dart';

import '../board/board-request.dart';

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

  Future<ResponseDTO> fetchBoardDetail(int boardId) async {
    final response = await dio.get("/api/boards/${boardId}/detail");

    // 서버에서 받은 데이터를 ResponseDTO로 변환
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // 필요한 추가 데이터 처리
    if (responseDTO.status == 200) {
      BoardDetailDTO boardDetailDTO = BoardDetailDTO.fromJson(responseDTO.body);

      responseDTO.body = boardDetailDTO;
    }

    // 변환된 데이터를 반환
    return responseDTO;
  }

  Future<ResponseDTO> boardSave(SaveBoardDTO saveBoardDTO) async {
    final response = await dio.post("/api/boards/write",
        data: saveBoardDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // if (responseDTO.status == 200) {
    //   responseDTO.body = SaveBoardResponseDTO.fromJson(responseDTO.body);
    // }

    return responseDTO;
  }
}

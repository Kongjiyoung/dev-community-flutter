import 'package:dev_community/_core/constants/http.dart';
import 'package:dev_community/dtos/board/board_response.dart';
import 'package:dev_community/dtos/response_dto.dart';

import '../board/board_request.dart';

class BoardRepository {
  Future<ResponseDTO> fetchBoardList({int? page}) async {
    final response =
        await dio.get("/api/boards/list", queryParameters: {"page": page});

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

      List<TopTenContent> newContentList = prevContentList
          .map((content) => TopTenContent.fromJson(content))
          .toList();

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
    final response =
        await dio.post("/api/boards/write", data: saveBoardDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // if (responseDTO.status == 200) {
    //   responseDTO.body = SaveBoardResponseDTO.fromJson(responseDTO.body);
    // }

    return responseDTO;
  }

  Future<ResponseDTO> fetchBookmarkBoardList({int? page}) async {
    final response =
        await dio.get("/api/bookmark/list?", queryParameters: {"page": page});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevContentList = responseDTO.body["boardDTO"];

      List<BookmarkContent> newContentList = prevContentList
          .map((bookmarkContent) => BookmarkContent.fromJson(bookmarkContent))
          .toList();

      responseDTO.body = newContentList;
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchSearchedBoardList(String query, {int? page}) async {
    final response = await dio.get("/api/boards/search",
        queryParameters: {"query": query, "page": page});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevList = responseDTO.body["content"];
      responseDTO.body =
          prevList.map((board) => SearchBoardListDTO.fromJson(board)).toList();
    }

    return responseDTO;
  }
}

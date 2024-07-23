import '../../_core/constants/http.dart';
import '../board/board_response.dart';
import '../response_dto.dart';

class BookMarkRepository {

  Future<ResponseDTO> bookMarkList({int? page}) async {
    final response = await dio.get(
        "/api/bookmark/list", queryParameters: {"page": page});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevContentList = responseDTO.body["boardDTO"];

      List<BookmarkContent> newContentList =
      prevContentList.map((bookmarkContent) => BookmarkContent.fromJson(bookmarkContent)).toList();
      print("Response: ${newContentList.length}");

      responseDTO.body = newContentList;
    }
    return responseDTO;
  }

  Future<ResponseDTO> bookMarkSave(int boardId) async {
    final response = await dio.post(
      "/api/bookmark/$boardId",
    );

    return ResponseDTO.fromJson(response.data);
  }

  Future<ResponseDTO> bookMarkDelete(int boardId) async {
    final response = await dio.delete(
      "/api/bookmark/$boardId",
    );

    return ResponseDTO.fromJson(response.data);
  }
}
import '../../_core/constants/http.dart';
import '../response_dto.dart';

class BookMarkRepository {
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
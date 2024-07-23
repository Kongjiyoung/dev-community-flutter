import '../../_core/constants/http.dart';
import '../response_dto.dart';

class LikeRepository {
  Future<ResponseDTO> likeSave(int boardId) async {
    final response = await dio.post(
      "/api/like/$boardId",
    );

    return ResponseDTO.fromJson(response.data);
  }

  Future<ResponseDTO> likeDelete(int boardId) async {
    final response = await dio.delete(
      "/api/like/$boardId",
    );

    return ResponseDTO.fromJson(response.data);
  }
}
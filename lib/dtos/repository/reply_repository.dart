import '../../_core/constants/http.dart';
import '../reply/reply_request.dart';
import '../response_dto.dart';

class ReplyRepository {
  Future<ResponseDTO> replySave(int boardId, ReplySaveDTO reqDTO) async {
    final response = await dio.post(
      "/api/reply/$boardId",
      data: reqDTO.toJson(),
    );



    return ResponseDTO.fromJson(response.data);
  }
}

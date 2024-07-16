class ResponseDTO {
  final int? status;
  final String? msg;
  dynamic body;

  ResponseDTO({
    this.status,
    this.msg,
    this.body,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        msg = json["msg"],
        body = json["body"];
}

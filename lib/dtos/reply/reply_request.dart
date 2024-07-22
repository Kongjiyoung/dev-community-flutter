class ReplySaveDTO {
  final String comment;

  ReplySaveDTO(this.comment);

  Map<String, dynamic> toJson() {
    return {
      "comment": this.comment,
    };
  }
}
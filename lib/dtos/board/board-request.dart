class SaveBoardDTO {
  final String? title;
  final String content;
  final List<ImagesDTO>? images;

  SaveBoardDTO(
      {this.title, required this.content,this.images});


  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "content": this.content,
      "images": this.images?.map((img) => img.toJson()).toList(),
    };
  }
}

class ImagesDTO {
  final String imageData;
  final String fileName;

  ImagesDTO({
    required this.imageData,
    required this.fileName,
  });

  Map<String, dynamic> toJson() {
    return {
      "imageData": this.imageData,
      "fileName": this.fileName,
    };
  }
}

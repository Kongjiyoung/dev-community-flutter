//main-page list
class Content {
  final int boardId;
  final String boardTitle;
  final String boardContent;
  final int boardHit;
  final String boardCreatedAt;
  final String boardCreatedAtDuration;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final bool myLike;
  final bool myBookmark;
  final int likeCount;
  final int bookmarkCount;
  final int replyCount;

  Content({
    required this.boardId,
    required this.boardTitle,
    required this.boardContent,
    required this.boardHit,
    required this.boardCreatedAt,
    required this.boardCreatedAtDuration,
    required this.userId,
    required this.userNickname,
    required this.userPosition,
    required this.userImage,
    required this.myLike,
    required this.myBookmark,
    required this.likeCount,
    required this.bookmarkCount,
    required this.replyCount,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        boardId: json["boardId"],
        boardTitle: json["boardTitle"],
        boardContent: json["boardContent"],
        boardHit: json["boardHit"],
        boardCreatedAt: json["boardCreatedAt"],
        boardCreatedAtDuration: json["boardCreatedAtDuration"] ?? "1초 전",
        userId: json["userId"],
        userNickname: json["userNickname"],
        userPosition: json["userPosition"],
        userImage: json["userImage"],
        myLike: json["myLike"],
        myBookmark: json["myBookmark"],
        likeCount: json["likeCount"],
        bookmarkCount: json["bookmarkCount"],
        replyCount: json["replyCount"],
      );

  Map<String, dynamic> toJson() => {
        "boardId": boardId,
        "boardTitle": boardTitle,
        "boardContent": boardContent,
        "boardHit": boardHit,
        "boardCreatedAt": boardCreatedAt,
        "boardCreatedAtDuration": boardCreatedAtDuration,
        "userId": userId,
        "userNickname": userNickname,
        "userPosition": userPosition,
        "userImage": userImage,
        "myLike": myLike,
        "myBookmark": myBookmark,
        "likeCount": likeCount,
        "bookmarkCount": bookmarkCount,
        "replyCount": replyCount,
      };

  Content copyWith({
    int? boardId,
    String? boardTitle,
    String? boardContent,
    int? boardHit,
    String? boardCreatedAt,
    String? boardCreatedAtDuration,
    int? userId,
    String? userNickname,
    String? userPosition,
    String? userImage,
    bool? myLike,
    bool? myBookmark,
    int? likeCount,
    int? bookmarkCount,
    int? replyCount,
  }) {
    return Content(
      boardId: boardId ?? this.boardId,
      boardTitle: boardTitle ?? this.boardTitle,
      boardContent: boardContent ?? this.boardContent,
      boardHit: boardHit ?? this.boardHit,
      boardCreatedAt: boardCreatedAt ?? this.boardCreatedAt,
      boardCreatedAtDuration:
          boardCreatedAtDuration ?? this.boardCreatedAtDuration,
      userId: userId ?? this.userId,
      userNickname: userNickname ?? this.userNickname,
      userPosition: userPosition ?? this.userPosition,
      userImage: userImage ?? this.userImage,
      myLike: myLike ?? this.myLike,
      myBookmark: myBookmark ?? this.myBookmark,
      likeCount: likeCount ?? this.likeCount,
      bookmarkCount: bookmarkCount ?? this.bookmarkCount,
      replyCount: replyCount ?? this.replyCount,
    );
  }
}

//인기 리스트
class TopTenContent {
  final int boardId;
  final String boardTitle;
  final String boardCreatedAt;
  final String boardCreatedAtDuration;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final int rank;

  TopTenContent({
    required this.boardId,
    required this.boardTitle,
    required this.boardCreatedAt,
    required this.boardCreatedAtDuration,
    required this.userId,
    required this.userNickname,
    required this.userPosition,
    required this.userImage,
    required this.rank,
  });

  factory TopTenContent.fromJson(Map<String, dynamic> json) => TopTenContent(
        boardId: json["boardId"],
        boardTitle: json["boardTitle"],
        boardCreatedAt: json["boardCreatedAt"],
        boardCreatedAtDuration: json["boardCreatedAtDuration"],
        userId: json["userId"],
        userNickname: json["userNickname"],
        userPosition: json["userPosition"],
        userImage: json["userImage"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "boardId": boardId,
        "boardTitle": boardTitle,
        "boardCreatedAt": boardCreatedAt,
        "boardCreatedAtDuration": boardCreatedAtDuration,
        "userId": userId,
        "userNickname": userNickname,
        "userPosition": userPosition,
        "userImage": userImage,
        "rank": rank,
      };
}

//bookmark list
class BookmarkContent {
  int userId;
  String userNickname;
  String userPosition;
  String userImage;
  int boardId;
  String boardTitle;
  String boardContent;
  int boardViews;
  String boardCreatedAt;
  int replyCount;
  int loveCount;
  bool love;
  bool bookmark;

  BookmarkContent({
    required this.userId,
    required this.userNickname,
    required this.userPosition,
    required this.userImage,
    required this.boardId,
    required this.boardTitle,
    required this.boardContent,
    required this.boardViews,
    required this.boardCreatedAt,
    required this.replyCount,
    required this.loveCount,
    required this.love,
    required this.bookmark,
  });

  factory BookmarkContent.fromJson(Map<String, dynamic> json) =>
      BookmarkContent(
        userId: json["userId"],
        userNickname: json["userNickname"],
        userPosition: json["userPosition"],
        userImage: json["userImage"],
        boardId: json["boardId"],
        boardTitle: json["boardTitle"],
        boardContent: json["boardContent"],
        boardViews: json["boardViews"],
        boardCreatedAt: json["boardCreatedAt"],
        replyCount: json["replyCount"],
        loveCount: json["loveCount"],
        love: json["love"],
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userNickname": userNickname,
        "userPosition": userPosition,
        "userImage": userImage,
        "boardId": boardId,
        "boardTitle": boardTitle,
        "boardContent": boardContent,
        "boardViews": boardViews,
        "boardCreatedAt": boardCreatedAt,
        "replyCount": replyCount,
        "loveCount": loveCount,
        "love": love,
        "bookmark": bookmark,
      };

  BookmarkContent copyWith({
    int? userId,
    String? userNickname,
    String? userPosition,
    String? userImage,
    int? boardId,
    String? boardTitle,
    String? boardContent,
    int? boardViews,
    String? boardCreatedAt,
    int? replyCount,
    int? loveCount,
    bool? love,
    bool? bookmark,
  }) {
    return BookmarkContent(
      userId: userId ?? this.userId,
      userNickname: userNickname ?? this.userNickname,
      userPosition: userPosition ?? this.userPosition,
      userImage: userImage ?? this.userImage,
      boardId: boardId ?? this.boardId,
      boardTitle: boardTitle ?? this.boardTitle,
      boardContent: boardContent ?? this.boardContent,
      boardViews: boardViews ?? this.boardViews,
      boardCreatedAt: boardCreatedAt ?? this.boardCreatedAt,
      replyCount: replyCount ?? this.replyCount,
      loveCount: loveCount ?? this.loveCount,
      love: love ?? this.love,
      bookmark: bookmark ?? this.bookmark,
    );
  }
}

// BoardDetail ==========================================================

class BoardDetailDTO {
  final int boardId;
  final String boardTitle;
  final String boardContent;
  final int boardHit;
  final String boardCreatedAt;
  final String boardCreatedAtDuration;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final bool myLike;
  final bool myBookmark;
  final int likeCount;
  final int bookmarkCount;
  final int replyCount;
  final List<ReplyDTO> replies;
  final List<BoardImagesDTO> images;
  final String sessionUserImg;

  BoardDetailDTO({
    required this.boardId,
    required this.boardTitle,
    required this.boardContent,
    required this.boardHit,
    required this.boardCreatedAt,
    required this.boardCreatedAtDuration,
    required this.userId,
    required this.userNickname,
    String? userPosition,
    required this.userImage,
    required this.myLike,
    required this.myBookmark,
    required this.likeCount,
    required this.bookmarkCount,
    required this.replyCount,
    required this.replies,
    required this.images,
    required this.sessionUserImg,
  }) : userPosition = userPosition ?? 'Default Position'; // null일 경우 기본값 설정

  factory BoardDetailDTO.fromJson(Map<String, dynamic> json) => BoardDetailDTO(
        boardId: json["boardId"],
        boardTitle: json["boardTitle"],
        boardContent: json["boardContent"],
        boardHit: json["boardHit"],
        boardCreatedAt: json["boardCreatedAt"],
        boardCreatedAtDuration: json["boardCreatedAtDuration"],
        userId: json["userId"],
        userNickname: json["userNickname"],
        userPosition: json["userPosition"],
        userImage: json["userImage"],
        sessionUserImg: json["sessionUserImg"],
        myLike: json["myLike"],
        myBookmark: json["myBookmark"],
        likeCount: json["likeCount"],
        bookmarkCount: json["bookmarkCount"],
        replyCount: json["replyCount"],
        replies: json["replies"] != null
            ? List<ReplyDTO>.from(
                json["replies"].map((x) => ReplyDTO.fromJson(x)))
            : [],
        images: json["images"] != null
            ? List<BoardImagesDTO>.from(
                json["images"].map((x) => BoardImagesDTO.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "boardId": boardId,
        "boardTitle": boardTitle,
        "boardContent": boardContent,
        "boardHit": boardHit,
        "boardCreatedAt": boardCreatedAt,
        "boardCreatedAtDuration": boardCreatedAtDuration,
        "userId": userId,
        "userNickname": userNickname,
        "userPosition": userPosition,
        "userImage": userImage,
        "myLike": myLike,
        "myBookmark": myBookmark,
        "likeCount": likeCount,
        "bookmarkCount": bookmarkCount,
        "replyCount": replyCount,
        "sessionUserImg": sessionUserImg,
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };

  BoardDetailDTO copyWith({
    int? boardId,
    String? boardTitle,
    String? boardContent,
    int? boardHit,
    String? boardCreatedAt,
    String? boardCreatedAtDuration,
    int? userId,
    String? userNickname,
    String? userPosition,
    String? userImage,
    String? sessionUserImg,
    bool? myLike,
    bool? myBookmark,
    int? likeCount,
    int? bookmarkCount,
    int? replyCount,
    List<ReplyDTO>? replies,
    List<BoardImagesDTO>? images,
  }) {
    return BoardDetailDTO(
      boardId: boardId ?? this.boardId,
      boardTitle: boardTitle ?? this.boardTitle,
      boardContent: boardContent ?? this.boardContent,
      boardHit: boardHit ?? this.boardHit,
      boardCreatedAt: boardCreatedAt ?? this.boardCreatedAt,
      boardCreatedAtDuration:
          boardCreatedAtDuration ?? this.boardCreatedAtDuration,
      userId: userId ?? this.userId,
      userNickname: userNickname ?? this.userNickname,
      userPosition: userPosition ?? this.userPosition,
      userImage: userImage ?? this.userImage,
      sessionUserImg: sessionUserImg ?? this.sessionUserImg,
      myLike: myLike ?? this.myLike,
      myBookmark: myBookmark ?? this.myBookmark,
      likeCount: likeCount ?? this.likeCount,
      bookmarkCount: bookmarkCount ?? this.bookmarkCount,
      replyCount: replyCount ?? this.replyCount,
      replies: replies ?? this.replies,
      images: images ?? this.images,
    );
  }
}

class ReplyDTO {
  final int id;
  final int boardId;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final String comment;
  final String updatedAt;

  ReplyDTO({
    required this.id,
    required this.boardId,
    required this.userId,
    required this.userNickname,
    String? userPosition,
    required this.userImage,
    required this.comment,
    required this.updatedAt,
  }) : userPosition = userPosition ?? 'Default Position'; // null일 경우 기본값 설정

  factory ReplyDTO.fromJson(Map<String, dynamic> json) => ReplyDTO(
        id: json["id"],
        boardId: json["boardId"],
        userId: json["userId"],
        userNickname: json["userNickname"],
        userPosition: json["userPosition"],
        userImage: json["userImage"],
        comment: json["comment"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "boardId": boardId,
        "userId": userId,
        "userNickname": userNickname,
        "userPosition": userPosition,
        "userImage": userImage,
        "comment": comment,
        "updatedAt": updatedAt,
      };

  ReplyDTO copyWith({
    int? id,
    int? boardId,
    int? userId,
    String? userNickname,
    String? userPosition,
    String? userImage,
    String? comment,
    String? updatedAt,
  }) {
    return ReplyDTO(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      userId: userId ?? this.userId,
      userNickname: userNickname ?? this.userNickname,
      userPosition: userPosition ?? this.userPosition,
      userImage: userImage ?? this.userImage,
      comment: comment ?? this.comment,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class BoardImagesDTO {
  final String filePath;

  BoardImagesDTO({
    required this.filePath,
  });

  factory BoardImagesDTO.fromJson(Map<String, dynamic> json) => BoardImagesDTO(
        filePath: json["filePath"],
      );

  Map<String, dynamic> toJson() => {
        "filePath": filePath,
      };
}

// BoardDetail ==========================================================

class SaveBoardResponseDTO {
  final String title;
  final String content;
  final List<ImagesResponseDTO> images;

  SaveBoardResponseDTO(
      {required this.title, required this.content, required this.images});

  factory SaveBoardResponseDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevEatDTOList = json["images"];
    List<ImagesResponseDTO> imagesList = prevEatDTOList
        .map((images) => ImagesResponseDTO.fromJson(images))
        .toList();

    return SaveBoardResponseDTO(
        title: json["title"], content: json["content"], images: imagesList);
  }
}

class ImagesResponseDTO {
  final String imageData;
  final String fileName;

  ImagesResponseDTO({
    required this.imageData,
    required this.fileName,
  });

  factory ImagesResponseDTO.fromJson(Map<String, dynamic> json) {
    return ImagesResponseDTO(
      imageData: json["imageData"],
      fileName: json["fileName"],
    );
  }
}

class SearchBoardListDTO {
  final int boardId;
  final String boardTitle;
  final String boardContent;

  SearchBoardListDTO(
      {required this.boardId,
      required this.boardTitle,
      required this.boardContent});

  factory SearchBoardListDTO.fromJson(Map<String, dynamic> json) {
    return SearchBoardListDTO(
      boardId: json["boardId"],
      boardTitle: json["boardTitle"],
      boardContent: json["boardContent"],
    );
  }
//
}
